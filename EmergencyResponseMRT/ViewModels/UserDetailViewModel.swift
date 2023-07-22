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
    @Published var userID : Int = -1
    
    @Published var user : ResponseUser? = nil
    
    var title : String = ""
    var accepted : Bool = false
    var endPoint = "https://goldfish-app-2qxib.ondigitalocean.app/user-detail/"
    var session = URLSession.shared
    let adminId = UserDefaults.standard.integer(forKey: "adminId")
    
    private var socket: SocketIOClient!
    let manager = SocketManager(socketURL: URL(string: "https://e703-45-64-100-55.ngrok-free.app")!, config: [.log(true)])
    @Published var socketStatus: String = "Not Connected"

    init(){
        socket = manager.defaultSocket
    }
    
    func setUserID(userID : Int) {
        self.userID = userID
    }
    
    func getUser() {
        guard let url = URL(string: "\(endPoint)\(userID)") else {
            print("URL is not valid")
            return
        }
        print("INI USER ID \(userID)")
        print("INI URL NYA \(url)")
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
                let user = try decoder.decode(ResponseUser.self, from: data)
                // Safely unwrap optionals
                self.user = user
            } catch {
                print("Decoding error: \(error)")
            }
        }

        task.resume()
    }

    
    func updateUserStatus(accepted : Bool) {
        socket.on(clientEvent: .connect) { data, ack in
            let notificationData = Notification(adminID: self.adminId, userID: self.userID, title: "ini apa ya? maaf gw isi ini dulu ya wkwk", description: self.user!.description, accepted: accepted)
            
            let encoder = JSONEncoder()
            let data = try? encoder.encode(notificationData)
            let stringifiedData = String(data: data!, encoding: String.Encoding.utf8)
            
            self.socket.emit("report-notifications", stringifiedData!)
            print("DATAAAA>>>>>>>> \(stringifiedData!)")
            print("Socket connected")
            self.socketStatus = "Connected to adminID: \(self.adminId)"
        }

        socket.on(clientEvent: .error) { data, ack in
            print("Socket error: \(data)")
            self.socketStatus = "Error"
        }

        socket.on(clientEvent: .disconnect) { data, ack in
            print("Socket disconnected: \(data)")
            self.socketStatus = "Disconnected"
        }
        socket?.connect()
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
