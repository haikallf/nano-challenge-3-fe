//
//  UserDetailViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 19/07/23.
//

import Foundation
import SocketIO
import CoreLocation

class UserDetailViewModel : ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var pinType: String = ""
    @Published var userImage: String = ""
    @Published var userID : Int = 0
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var description : String = ""
    @Published var location : String = ""
    @Published var status : String = ""
    
    var title : String = ""
    var accepted : Bool = false
    var endPoint = "https://goldfish-app-2qxib.ondigitalocean.app/user-detail/"
    var session = URLSession.shared
    
    
    func getUser() {
        guard let url = URL(string: "\(endPoint)\(userID)") else {
            print("URL is not valid")
            return
        }
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let task = session.dataTask(with: req) { data, response, error in
            print("-----> data: \(String(describing: data))")
            print("-----> error: \(String(describing: error?.localizedDescription))")
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(UserDetailResponse.self, from: data)
                self.name = user.name
                self.email = user.email
                self.password = user.password
                self.pinType = user.pinType
                self.gender = user.gender
                self.description = user.description
                self.age = user.age
                self.location = user.location
                self.status = user.status
                self.userImage = user.userImage
            } catch {
                print("Decoding error")
            }
            
            
        }
        
        task.resume()
    }
    
    func getCondition(pinType: String) -> String {
        switch(pinType) {
        case "blue" :
            return "Hamil"
        case "red" :
            return "Lansia"
        default :
            return "Hamil"
        }
    }
}
