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
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

//final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    var locationManager: CLLocationManager?
//
//    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
//
//    func checkIfLocationServicesIsEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            locationManager!.delegate = self
////            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//
//
//        } else {
//            print("Location is off")
//        }
//    }
//
//    func startUpdatingUserLocation() {
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.startUpdatingLocation()
//    }
//
//    private func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestAlwaysAuthorization()
//        case .restricted:
//            print("Your location is restricted")
//        case .denied:
//            print("You have denied this app location permission")
//        case .authorizedAlways:
////            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapConstants.defaultSpan)
//            break
//        case .authorizedWhenInUse:
//            locationManager.requestAlwaysAuthorization()
//        @unknown default:
//            break
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorization()
//    }
//
//    // get user region
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//
//        self.region = MKCoordinateRegion(center: location.coordinate, span: MapConstants.defaultSpan)
//    }
//}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?

    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
    @Published var userLocation: CLLocationCoordinate2D? = nil

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
                self?.region = MKCoordinateRegion(center: coordinate, span: MapConstants.defaultSpan)
            }
            print("COORDINATE (lat, long): (\(coordinate.latitude), \(coordinate.longitude))")
        }
    }
}


//final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    var locationManager: CLLocationManager?
//
//    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
//    @Published var userLocation: CLLocationCoordinate2D? = nil
//    @Published var shouldResetToCenter = false
//
//    private var isDragging = false
//
//    func checkIfLocationServicesIsEnabled() {
//        guard CLLocationManager.authorizationStatus() != .denied else {
//            print("Location services are denied")
//            return
//        }
//
//        locationManager = CLLocationManager()
//        locationManager!.delegate = self
//
//        if CLLocationManager.authorizationStatus() == .notDetermined {
//            locationManager?.requestAlwaysAuthorization()
//        }
//    }
//
//    private func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            locationManager.requestAlwaysAuthorization()
//        case .restricted:
//            print("Your location is restricted")
//        case .denied:
//            print("You have denied this app location permission")
//        case .authorizedAlways, .authorizedWhenInUse:
//            break
//        @unknown default:
//            break
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorization()
//    }
//
//    func startUpdatingUserLocation() {
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.startUpdatingLocation()
//    }
//
//    func stopUpdatingUserLocation() {
//        locationManager?.stopUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//
//        userLocation = location.coordinate
//        updateRegion(location.coordinate)
//    }
//
//    private func updateRegion(_ coordinate: CLLocationCoordinate2D) {
//        DispatchQueue.main.async { [weak self] in
//            withAnimation {
//                if self?.shouldResetToCenter == false {
//                    self?.region = MKCoordinateRegion(center: coordinate, span: MapConstants.defaultSpan)
//                }
//            }
//            print("COORDINATE (lat, long): (\(coordinate.latitude), \(coordinate.longitude))")
//        }
//    }
//
//    func mapDragged() {
//        isDragging = true
//    }
//
//    func mapDragEnded() {
//        isDragging = false
//    }
//
//    func resetMapToCenter() {
//        shouldResetToCenter = true
//        guard let location = locationManager?.location else { return }
//        userLocation = location.coordinate
//        region = MKCoordinateRegion(center: location.coordinate, span: MapConstants.defaultSpan)
//    }
//
//    func confirmResetToCenter() {
//        shouldResetToCenter = false
//    }
//}
