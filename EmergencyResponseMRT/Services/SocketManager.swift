//
//  SocketManager.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 20/07/23.
//

import UIKit
import SocketIO

class SocketTutorialManager {

    // MARK: - Delegate
    weak var delegate: SocketPositionManagerDelegate?

    // MARK: - Properties

    let manager = SocketManager(socketURL: URL(string: "https://goldfish-app-2qxib.ondigitalocean.app/")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil

    // MARK: - Life Cycle

    init(_ delegate: SocketPositionManagerDelegate) {
        self.delegate = delegate
        setupSocket()
        setupSocketEvents()
        socket?.connect()
    }

    func stop() {
        socket?.removeAllHandlers()
    }

    // MARK: - Socket Setups

    func setupSocket() {
        self.socket = manager.defaultSocket
    }

    
    func setupSocketEvents() {

        socket?.on(clientEvent: .connect) {data, ack in
            self.delegate?.didConnect()
        }

        socket?.on("report-notifications") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: Notification = try? SocketParser.convert(data: dataInfo) {
                if response.adminID == UserDefaults.standard.integer(forKey: "adminId") {
                    NotificationService().sendNotification(title: response.title, body: response.description)
                }
                let notification = Notification(
                    adminID: response.adminID,
                    userID: response.userID,
                    title: response.title,
                    description: response.description,
                    accepted: response.accepted
                )
                
                self.delegate?.didReceive(notification: notification)
                
            }
        }

    }

    // MARK: - Socket Emits

    func socketChanged(notification: Notification) {
        let info: [String : Any] = [
            "adminID": notification.adminID,
            "userID": notification.userID,
            "title": notification.title,
            "description": notification.description,
            "accepted": notification.accepted
        ]
        socket?.emit("report-notifications", info)
    }

}
