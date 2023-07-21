//
//  UserDetailResponse.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 22/07/23.
//

import Foundation

struct UserDetailResponse: Codable, Hashable {
    let userID: Int
    let name: String
    let email: String
    let password: String
    let pinType: String
    let gender: String
    let description: String
    let age: String
    let location: String
    let status: String
    let userImage: String
}
