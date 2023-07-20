//
//  Notification.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 20/07/23.
//

import Foundation

struct Notification : Codable {
    var adminID: Int = 0
    var userID: Int = 0
    var title: String = ""
    var description: String = ""
    var accepted: Bool = false
    
    init(adminID: Int, userID: Int, title: String, description: String, accepted: Bool) {
        self.adminID = adminID
        self.userID = userID
        self.title = title
        self.description = description
        self.accepted = accepted
    }
}
