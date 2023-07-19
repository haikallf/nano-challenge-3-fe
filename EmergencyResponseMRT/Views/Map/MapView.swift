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
    @State private var isSheetShown: Bool = false
    @State private var detents: PresentationDetent = .fraction(0.75)
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.otherUsers) { userLocation in
                MapAnnotation(coordinate: userLocation.coordinate) {
                    Image(systemName: "person.fill")
                        .foregroundColor(viewModel.colorForString(userLocation.pinType))
                        .onTapGesture {
                            isSheetShown = true
                        }
                }
            }
            .ignoresSafeArea()
            .gesture(DragGesture().onChanged { _ in
                viewModel.shouldResetToCenter = false
            })
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
                viewModel.startUpdatingUserLocation()
            }
            
            VStack{
                CupertinoButton("Show Sheet") {
                    isSheetShown.toggle()
                }
                .padding(.horizontal, 120)
                .padding(.bottom, 72)
                .sheet(isPresented: $isSheetShown) {
                    UserDetailView(detents: $detents, isSheetShown: $isSheetShown)
                }
            }
            
            if (!viewModel.shouldResetToCenter) {
                VStack {
                    Spacer()
                    CupertinoButton("Re-Center", action: {
                        viewModel.resetMapToCenter()
                    })
                }
                .padding(.horizontal, 120)
                .padding(.bottom, 72)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
