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
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
//            .accentColor(.red)
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
