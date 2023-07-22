//
//  MapViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI
import CoreLocation
import MapKit
import SocketIO


enum MapConstants {
    static let startingLocation = CLLocationCoordinate2D(latitude: -6.242873624986951, longitude: 106.79801059458454)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?

    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
    @Published var userLocation: CLLocationCoordinate2D? = nil
    @Published var shouldResetToCenter: Bool = false
    @Published var otherUsers: [UserAnnotation] = []
    @Published var showUserDetailsSheet: Bool = false
    @Published var userID: Int = 0
    
    let adminId = UserDefaults.standard.integer(forKey: "adminId")
    let manager = SocketManager(socketURL: URL(string: GlobalStates().baseURL)!, config: [.log(true)])
    
    private var socket: SocketIOClient!
    @Published var socketStatus: String = "Not Connected"
    
    override init() {
        super.init()
        socket = manager.defaultSocket
    }
    
    func connectToSocket() {
        socket.on(clientEvent: .connect) { data, ack in
            print("Socket connected")
            self.socketStatus = "Connected"
        }

        socket.on(clientEvent: .error) { data, ack in
            print("Socket error: \(data)")
            self.socketStatus = "Error"
        }

        socket.on(clientEvent: .disconnect) { data, ack in
            print("Socket disconnected: \(data)")
            self.socketStatus = "Disconnected"
        }

        socket.on("report-notifications") { data, ack in
            // Handle incoming location update from the server
            print("RAW DATA -> \(data.first!)")
            print("ADMIN ID YES -> \(self.adminId)")
            if let jsonString = data.first as? String,
               let jsonData = jsonString.data(using: .utf8) {
                
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode([Notification].self, from: jsonData)
                    print("DECODED DATA -> \(decodedData)")
                    print("ADMINID -> \(decodedData.first!.adminID)")
                    print("MASUK SAJA")
                    if decodedData.first!.adminID == self.adminId {
                        print("MASUK DAN BENAR")
                        self.userID =  decodedData.first?.userID ?? 0
                        self.showUserDetailsSheet = true
                        NotificationService().sendNotification(title: decodedData.first!.title, body: decodedData.first!.description)
                    }
                } catch {
                    print("Error decoding JSON data: \(error)")
                }
            } else {
                print("Invalid JSON data")
            }
        }
        socket?.connect()
    }
    
    func updateOtherUsersLocation() {
        socket.on(clientEvent: .connect) { data, ack in
            print("Socket connected")
            self.socketStatus = "Connected"
        }

        socket.on(clientEvent: .error) { data, ack in
            print("Socket error: \(data)")
            self.socketStatus = "Error"
        }

        socket.on(clientEvent: .disconnect) { data, ack in
            print("Socket disconnected: \(data)")
            self.socketStatus = "Disconnected"
        }

        socket.on("user-coordinates") { data, ack in
            // Handle incoming location update from the server
            print("RAW DATA -> \(data.first!)")
            if let jsonString = data.first as? String,
               let jsonData = jsonString.data(using: .utf8) {

                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode([UserAnnotation].self, from: jsonData)
                    print("DECODED DATA USER -> \(decodedData)")
                    withAnimation {
                        self.otherUsers = decodedData
                    }
                } catch {
                    print("Error decoding JSON data: \(error)")
                }
            } else {
                print("Invalid JSON data")
            }
        }
        
        socket?.connect()
    }
    
    func updateAdminLocation(latitude: Double, longitude: Double) {
        socket.on(clientEvent: .connect) { data, ack in
            let adminData = AdminCoordinateDetail(adminID: self.adminId, geolocationCoordinates: Coordinate(latitude: latitude, longitude: longitude))
            
            let encoder = JSONEncoder()
            let data = try? encoder.encode(adminData)
            let stringifiedData = String(data: data!, encoding: String.Encoding.utf8)
            
//            let jsonData = try? JSONSerialization.data(withJSONObject: adminData)
            
            self.socket.emit("admin-coordinates", stringifiedData!)
            print("DATAAAA>>>>>>>> \(stringifiedData!)")
            print("Socket connected")
            self.socketStatus = "Connected to adminID: \(self.adminId)"
        }

        socket.on(clientEvent: .error) { data, ack in
            print("Socket error: \(data)")
            self.socketStatus = "Error"
        }

        socket.on(clientEvent: .disconnect) { data, ack in
            print("Socket disconnected: \(data)")
            self.socketStatus = "Disconnected"
        }
        socket?.connect()
    }

    func checkIfLocationServicesIsEnabled() {
        guard CLLocationManager.authorizationStatus() != .denied else {
            print("Location services are denied")
            return
        }

        locationManager = CLLocationManager()
        locationManager!.delegate = self

        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager?.requestAlwaysAuthorization()
        }
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }

        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied:
            print("You have denied this app location permission")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    func startUpdatingUserLocation() {
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }

    func stopUpdatingUserLocation() {
        locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        userLocation = location.coordinate
        updateRegion(location.coordinate)
        updateAdminLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }

    private func updateRegion(_ coordinate: CLLocationCoordinate2D) {
        if self.shouldResetToCenter == true {
            DispatchQueue.main.async { [weak self] in
                withAnimation {
                    self?.region = MKCoordinateRegion(center: coordinate, span: MapConstants.defaultSpan)
                }
            }
        }
        print("COORDINATE (lat, long): (\(coordinate.latitude), \(coordinate.longitude))")
    }
    
    func resetMapToCenter() {
        self.shouldResetToCenter = true
        guard let location = locationManager?.location else { return }
        userLocation = location.coordinate
        updateRegion(location.coordinate)
    }
    
    func colorForString(_ string: String) -> Color {
        switch string {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "blue":
            return Color.blue
        case "yellow":
            return Color.yellow
        case "orange":
            return Color.orange
        default:
            return Color.black
        }
    }
}
