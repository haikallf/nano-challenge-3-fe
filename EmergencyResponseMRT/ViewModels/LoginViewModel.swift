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
    
    var globalStates = GlobalStates()
    
    func login() {
        
        let body: [String: Any] = ["email": email, "password": password]
            
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "\(globalStates.baseURL)/auth\(isAdmin ? "/admin" : "/user")") else { return print("URL not found!") }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(String(describing: data))")
            print("-----> error: \(String(describing: error?.localizedDescription))")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }

            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                print(">>> ADMINID: \(responseJSON["adminID"])")
            }
        }
        
        task.resume()
        
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(isAdmin, forKey: "isAdmin")
    }
}
