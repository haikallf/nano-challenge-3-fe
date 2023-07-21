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
//    @Published var user: User = User.all[1]
    @Published var name: String = ""
    @Published var age: Int = 0
    @Published var gender: String = ""
    @Published var pinType: String = ""
    @Published var profileImage: String = ""
    @Published var adminID : Int = 0
    
    var userID : Int = 0
    var title : String = ""
    var description : String = ""
    var accepted : Bool = false
    var endPoint = "https://raw.githubusercontent.com/athoya/dummy-json-server/main/"
    var session = URLSession.shared
    
    
    func getUser() {
        guard let url = URL(string: "\(endPoint)\(adminID)") else {
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
                let user = try decoder.decode(User.self, from: data)
                self.name = user.name
                self.age = user.age
                self.gender = user.gender
                self.pinType = self.getCondition(pinType: user.pinType)
                self.profileImage = user.urlImg
            } catch {
                print("Decoding error")
            }
            
            
        }
        
        task.resume()
    }
    
    func getCondition(pinType: String) -> String {
        switch(pinType) {
        case "blue" :
            return "Ibu Hamil"
        case "red" :
            return "Lansia"
        default :
            return "Ibu Hamil"
        }
    }
}
