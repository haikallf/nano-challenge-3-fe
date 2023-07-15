//
//  User.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 15/07/23.
//

import SwiftUI
import CoreLocation

struct User: Identifiable {
    let id: Int
    let name: String
    let isAdmin: Bool
    let pinType: String
    let coordinate: CLLocationCoordinate2D
}

extension User {
    static let all = [
        User(id: 1, name: "Amy", isAdmin: false, pinType: "blue", coordinate: CLLocationCoordinate2D(latitude: 37.33694956720551, longitude: -122.0346092901705)),
        User(id: 2, name: "Jennifer", isAdmin: false, pinType: "red", coordinate: CLLocationCoordinate2D(latitude: 37.33561882708385, longitude: -122.03677651498624)),
        User(id: 3, name: "Sarah", isAdmin: false, pinType: "yellow", coordinate: CLLocationCoordinate2D(latitude: 37.33621595697752, longitude: -122.03140136828976)),
        User(id: 4, name: "Henry", isAdmin: false, pinType: "orange", coordinate: CLLocationCoordinate2D(latitude: 37.33579161852587, longitude: -122.0288628430053)),
        User(id: 5, name: "Kyle", isAdmin: true, pinType: "", coordinate: CLLocationCoordinate2D(latitude: 37.337992440164435, longitude: -122.0300859302674)),
        User(id: 6, name: "Jake", isAdmin: false, pinType: "green", coordinate: CLLocationCoordinate2D(latitude: 37.336184017819065, longitude: -122.0276397557229)),
    ]
}
