//
//  ListViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 21/07/23.
//

import SwiftUI

class ListViewModel: ObservableObject {
    @Published var selectedItem = 0
    @Published var users: [UserDetailResponse] = []
    
    var globalStates = GlobalStates()
    
    func getSelectedUsersArray(usersArr: [UserDetailResponse]) -> [UserDetailResponse] {
        switch selectedItem {
        case 0:
            return usersArr.filter{($0.status == "fine" || $0.status == "requesting")}
        case 1:
            print(selectedItem)
            return  usersArr.filter{($0.status == "assisted")}
        case 2:
            print(selectedItem)
            return usersArr.filter{($0.status == "done")}
        default:
            return []
        }
    }
    
    func getAllUsers() {
        guard let url = URL(string: "\(globalStates.baseURL)/user-detail/all") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(String(describing: data))")
            print("-----> error: \(String(describing: error?.localizedDescription))")

            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            print("-----> Status Code: \(response.statusCode)")
            
            do {
                let decoder = JSONDecoder()
                let usersResponse = try decoder.decode([UserDetailResponse].self, from: data)
                DispatchQueue.main.async {
                    self.users = self.getSelectedUsersArray(usersArr: usersResponse)
                }
               
            } catch {
                print("Error decoding response: \(error)")
            }
        }
        task.resume()
    }
}
