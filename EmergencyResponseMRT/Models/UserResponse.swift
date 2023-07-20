//
//  UserResponse.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 20/07/23.
//

import Foundation

struct UserResponse: Codable {
    let userID: Int
    let email: String
    let password: String
    let name: String
    let status: String
    let userImage: URL
}

