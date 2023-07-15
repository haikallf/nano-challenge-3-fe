//
//  MapView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                    viewModel.startUpdatingUserLocation()
                }
            
            VStack {
                Spacer()
                CupertinoButton("Re-Center", action: {})
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
