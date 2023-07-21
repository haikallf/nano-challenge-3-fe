//
//  AdminResponse.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 20/07/23.
//

import Foundation

struct AdminResponse: Codable {
    let adminID: Int
    let email: String
    let password: String
    let name: String
    let status: String
    let adminImage: URL
}
