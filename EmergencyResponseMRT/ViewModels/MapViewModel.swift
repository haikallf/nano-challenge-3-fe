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

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: MapConstants.startingLocation, span: MapConstants.defaultSpan)
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            
        } else {
            print("Location is off")
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
        case .authorizedAlways:
//            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapConstants.defaultSpan)
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    // get user region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
