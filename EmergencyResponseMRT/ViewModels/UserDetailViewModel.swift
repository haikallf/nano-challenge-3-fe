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
    @Published var user: User = User.all[1]
    @Published var name: String = ""
    @Published var pinType: String = ""
    @Published var profileImage: String = ""
    
    var adminID : Int = 0
    var userID : Int = 0
    var title : String = ""
    var description : String = ""
    var accepted : Bool = false
    
    let manager = SocketManager(socketURL: URL(string: "https://c13f-158-140-189-122.ngrok-free.app/admin-detail")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil
    var endPoint = "https://raw.githubusercontent.com/athoya/dummy-json-server/main/"
    var session = URLSession.shared
    
    init() {
        setupSocket()
        setupSocketEvents()
        getUserDetailById()
    }
    
    func setupSocket() {
        self.socket = manager.defaultSocket
    }
    
    func setupSocketEvents() {
        socket?.on("report-notifications") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: Notification = try? SocketParser.convert(data: dataInfo) {
                if response.adminID == UserDefaults.standard.integer(forKey: "adminId") {
                    NotificationService().sendNotification(title: response.title, body: response.description)
                    self.adminID =  response.adminID
                    self.userID = response.userID
                    self.title = response.title
                    self.description = response.description
                    self.accepted = response.accepted
                }
            }
        }

    }
    
    func socketChanged(notification: Notification) {
        let info: [String : Any] = [
            "adminID": notification.adminID,
            "userID": notification.userID,
            "title": notification.title,
            "description": notification.description,
            "accepted": notification.accepted
        ]
        socket?.emit("report-notifications", info)
    }
    
    func getUserDetailById() -> User {
        guard let url = URL(string: endPoint) else {
            print("URL is not valid")
            return User(id: 0, name: "Axel", urlImg: "Elderly", isAdmin: false, pinType: "red", coordinate: CLLocationCoordinate2D(latitude: 37.336184017819065, longitude: -122.0276397557229))
        }
        let req = URLRequest(url: url)
        
        // TODO: Create request with URLSession
        let (data, response) = try await session.data(for: req)
        
        // TODO: Retrieve data to our data model using JSONDecoder
        let decoder = JSONDecoder()
        let user = try decoder.decode(User.self, from: data)
        
        return user
    }
    
    func getName() -> String {
        return user.name
    }
    
    func getPinType() -> String {
        return user.pinType
    }
    
    func getProfileImage() -> String {
        return user.urlImg
    }
    
    func getPinTypeImage() -> String {
        switch(user.pinType) {
        case "blue" :
            return "PregnantWoman"
        case "red" :
            return "Elderly"
        default :
            return "PregnantWoman"
        }
    }
    
    func getCondition() -> String {
        switch(user.pinType) {
        case "blue" :
            return "Ibu Hamil"
        case "red" :
            return "Lansia"
        default :
            return "Ibu Hamil"
        }
    }
}
