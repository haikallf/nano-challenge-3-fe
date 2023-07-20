//
//  Delegate.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 20/07/23.
//

import Foundation

protocol SocketPositionManagerDelegate: class {
    func didConnect()
    func didReceive(notification: Notification)
}
