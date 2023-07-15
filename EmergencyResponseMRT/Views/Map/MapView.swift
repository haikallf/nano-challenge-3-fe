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
                .gesture(DragGesture().onChanged { _ in
                    viewModel.shouldResetToCenter = false
                })
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                    viewModel.startUpdatingUserLocation()
                }
            
            if (!viewModel.shouldResetToCenter) {
                VStack {
                    Spacer()
                    CupertinoButton("Re-Center", action: {
                        viewModel.resetMapToCenter()
                    })
                }
                .padding(.horizontal, 120)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
