//
//  LoginViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAdmin: Bool = false
    @Published var shouldNavigate: Bool = false
    
    var globalStates = GlobalStates()
    
    func login() {
        let body: [String: Any] = ["email": email, "password": password]
            
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "\(globalStates.baseURL)/auth\(isAdmin ? "/admin" : "/user")") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(String(describing: data))")
            print("-----> error: \(String(describing: error?.localizedDescription))")

            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            print("-----> Status Code: \(response.statusCode)")
            
            if (self.isAdmin) {
                do {
                    let decoder = JSONDecoder()
                    let adminResponse = try decoder.decode(AdminResponse.self, from: data)
                    
                    print(">>> Admin ID: \(adminResponse.adminID)")
                    print(">>> Name: \(adminResponse.name)")
                    print(">>> Email: \(adminResponse.email)")
                    print(">>> Status: \(adminResponse.status)")
                   
                    if (response.statusCode == 200) {
                        UserDefaults.standard.set(adminResponse.adminID, forKey: "adminId")
                        UserDefaults.standard.set(adminResponse.name, forKey: "name")
                        UserDefaults.standard.set(adminResponse.email, forKey: "email")
                        UserDefaults.standard.set(adminResponse.status, forKey: "status")
                        UserDefaults.standard.set(adminResponse.adminImage, forKey: "adminImage")
                        UserDefaults.standard.set(self.isAdmin, forKey: "isAdmin")
                        DispatchQueue.main.async {
                            self.shouldNavigate = true
                        }
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            } else {
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(UserResponse.self, from: data)
                    
                    print(">>> User ID: \(userResponse.userID)")
                    print(">>> Name: \(userResponse.name)")
                    print(">>> Email: \(userResponse.email)")
                    print(">>> Status: \(userResponse.status)")
                    
                    if (response.statusCode == 200) {
                        UserDefaults.standard.set(userResponse.userID, forKey: "adminId")
                        UserDefaults.standard.set(userResponse.name, forKey: "name")
                        UserDefaults.standard.set(userResponse.email, forKey: "email")
                        UserDefaults.standard.set(userResponse.status, forKey: "status")
                        UserDefaults.standard.set(userResponse.userImage, forKey: "adminImage")
                        UserDefaults.standard.set(self.isAdmin, forKey: "isAdmin")
                        DispatchQueue.main.async {
                            self.shouldNavigate = true
                        }
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }
        
        task.resume()
    }
}
