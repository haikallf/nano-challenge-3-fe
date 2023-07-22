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
    @State private var isSheetShown: Bool = false // udah gadipake, kalo debug bisa dipake
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.otherUsers) { userLocation in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: userLocation.geolocationCoordinates.latitude, longitude: userLocation.geolocationCoordinates.longitude)) {
                    Image("pinAnnotation-\(userLocation.pinType == "lansia" ? "lansia" : "bumil")")
                        .foregroundColor(.cyan)
                        .onTapGesture {
                            isSheetShown = true
                        }
                }
            }
            .ignoresSafeArea()
            .gesture(DragGesture().onChanged { _ in
                viewModel.shouldResetToCenter = false
            })
            .sheet(isPresented: $viewModel.showUserDetailsSheet) {
                UserDetailView(userID: $viewModel.userID, detents: $detents, isSheetShown: $viewModel.showUserDetailsSheet, region: $viewModel.region)
            }
            .navigationBarHidden(true)
//            .overlay(
//                VStack {
//                    Text(viewModel.socketStatus)
//                }
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.black.opacity(0.7))
//                .cornerRadius(10)
//                .padding(),
//                alignment: .top
//            )
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
                viewModel.startUpdatingUserLocation()
                viewModel.connectToSocket()
                viewModel.updateOtherUsersLocation()
            }
            
//            VStack{
//                CupertinoButton("Show Sheet") {
//                    isSheetShown.toggle()
//                }
//                .padding(.horizontal, 120)
//                .padding(.bottom, 72)
//                
//            }
            
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
//        .sheet(isPresented: $viewModel.showUserDetailsSheet) {
//            UserDetailView(userID: $viewModel.userID, detents: $detents, isSheetShown: $viewModel.showUserDetailsSheet)
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
