//
//  User.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 15/07/23.
//

import SwiftUI
import CoreLocation
import Foundation

struct Coordinate: Equatable, Codable {
    let latitude: Double
    let longitude: Double
}

struct User: Equatable, Identifiable, Codable {
    let id: Int
    let name: String
    let age: Int
    let gender: String
    let urlImg: String
    let isAdmin: Bool
    let pinType: String
    let coordinate: Coordinate
}

extension User {
    static let all = [
        User(id: 1, name: "Amy", age: 24, gender: "Female", urlImg: "https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80", isAdmin: false, pinType: "blue", coordinate: Coordinate(latitude: 37.33694956720551, longitude: -122.0346092901705)),
        User(id: 2, name: "Jennifer", age: 28, gender: "Female", urlImg: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80", isAdmin: false, pinType: "red", coordinate: Coordinate(latitude: 37.33561882708385, longitude: -122.03677651498624)),
        User(id: 3, name: "Sarah", age: 33, gender: "Female",urlImg: "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80", isAdmin: false, pinType: "yellow", coordinate: Coordinate(latitude: 37.33621595697752, longitude: -122.03140136828976)),
        User(id: 4, name: "Henry", age: 75, gender: "Male",urlImg: "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg", isAdmin: false, pinType: "orange", coordinate: Coordinate(latitude: 37.33579161852587, longitude: -122.0288628430053)),
        User(id: 5, name: "Kyle", age: 64, gender: "Female",urlImg: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80", isAdmin: true, pinType: "", coordinate: Coordinate(latitude: 37.337992440164435, longitude: -122.0300859302674)),
        User(id: 6, name: "Jake", age: 81, gender: "Male",urlImg: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80", isAdmin: false, pinType: "green", coordinate: Coordinate(latitude: 37.336184017819065, longitude: -122.0276397557229)),
    ]
}
