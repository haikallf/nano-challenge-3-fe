//
//  UserAnnotation.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 22/07/23.
//

import Foundation

struct UserAnnotation: Equatable, Codable, Identifiable {
    let userID: Int
    let geolocationCoordinates: Coordinate

    var id: Int { // Computed property using userID as the id
        return userID
    }

    init(userID: Int, geolocationCoordinates: Coordinate) {
        self.userID = userID
        self.geolocationCoordinates = geolocationCoordinates
    }
}
