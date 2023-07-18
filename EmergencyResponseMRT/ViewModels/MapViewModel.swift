//
//  MapViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI
import CoreLocation
import MapKit

enum MapConstants {
    static let startingLocation = CLLocationCoordinate2D(latitude: -6.298897064753389, longitude: 106.65396658656464)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?

    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
    @Published var userLocation: CLLocationCoordinate2D? = nil
    @Published var shouldResetToCenter: Bool = false
    @Published var otherUsers: [User] = User.all

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
    }

    private func updateRegion(_ coordinate: CLLocationCoordinate2D) {
        DispatchQueue.main.async { [weak self] in
            withAnimation {
                if self?.shouldResetToCenter == true {
                    self?.region = MKCoordinateRegion(center: coordinate, span: MapConstants.defaultSpan)
                }
            }
            print("COORDINATE (lat, long): (\(coordinate.latitude), \(coordinate.longitude))")
        }
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
