//
//  ResponseUser.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 23/07/23.
//

import Foundation

struct ResponseUser: Codable {
    let name: String
    let pinType: String
    let gender: String
    let description: String
    let needs: String
    let age: String
    let location: String
    let status: String
    let userImage: String
    let geolocationCoordinates : Coordinate
}
