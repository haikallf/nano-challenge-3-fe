//
//  UserAnnotation.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 22/07/23.
//

import Foundation

struct UserAnnotation: Equatable, Codable, Identifiable {
    let userID: Int
    let pinType: String
    let geolocationCoordinates: Coordinate

    var id: Int { // Computed property using userID as the id
        return userID
    }

    init(userID: Int, pinType: String, geolocationCoordinates: Coordinate) {
        self.userID = userID
        self.pinType = pinType
        self.geolocationCoordinates = geolocationCoordinates
    }
}
