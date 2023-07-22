//
//  UserDetailView.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 19/07/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct UserDetailView: View {
    
    @Binding var userID: Int
    @Binding var detents : PresentationDetent
    @Binding var isSheetShown : Bool
    @State var isDisabled : Bool = true
    @State var accepted : Bool = false
    @Binding var region : MKCoordinateRegion
    
    var fullSheet : PresentationDetent = .large
    @State var halfSheet : PresentationDetent = .large
    @StateObject private var viewModel = UserDetailViewModel()
    
    var body: some View {
        ZStack {
            Color("backgroundSheet")
                .ignoresSafeArea()
            VStack (spacing: 5){
                if detents == fullSheet && !accepted {
                    HStack{
                        Image(viewModel.user?.pinType ?? "Lansia")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76, height: 20)

                    }
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: viewModel.user?.userImage ?? "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(viewModel.user?.name ?? "Marcus")
                            .fontWeight(.semibold)
                            .font(.title)
                        Spacer()
                    }
                   
                    
                    HStack{
                        Spacer()
                        Text(viewModel.user?.age ?? "66")
                            .fontWeight(.semibold)
                            .font(.title)
                        Image(viewModel.user?.gender ?? "Male")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Keluhan")
                            .font(.title2)
                        Spacer()
                    }

                    HStack() {
                        Image("Medical")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("Tidak dapat menaiki kereta dengan benar")
                            .font(.title3)
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("backgroundContainer"))
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 5, y : 5)
                    
                    HStack {
                        Text("Kebutuhan")
                            .font(.title2)
                        Spacer()
                    }
                    
                    
                    HStack() {
                        Text(viewModel.user?.needs ?? "Mau makan")
                            .font(.title3)
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("backgroundContainer"))
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 5, y : 5)
                    
                   Spacer()
                    
                    CupertinoButton("Terima") {
                        accepted = true
                        viewModel.updateUserStatus(accepted: accepted)
                        halfSheet = .fraction(0.35)
                        detents = halfSheet
                        isDisabled = false
                    }

                } else if detents == halfSheet && accepted {
                    HStack{
                        AsyncImage(url: URL(string: viewModel.user?.userImage ?? "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle()) // Clip the image into a circle shape
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(spacing: 5) {
                            HStack{
                                Image(viewModel.user?.pinType ?? "Lansia")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 76, height: 20)
                                Spacer()

                            }
                            HStack {
                                Text("\(viewModel.user?.name ?? "Marcus"), \(viewModel.user?.age ?? "66")")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                Image(viewModel.user?.gender ?? "Male")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Spacer()
                            }
                            HStack {
                                Text(viewModel.user?.location ?? "Blok M")
                                    .font(.title3)
                                Spacer()
                            }
                            CupertinoButton("Tunjukkan") {
                                print("tunjukkan")
                                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: viewModel.user?.geolocationCoordinates.latitude ?? 0, longitude: viewModel.user?.geolocationCoordinates.longitude ?? 0), span: MapConstants.defaultSpan)
                            }
                        }
                    }
                    
                } else if detents == fullSheet && accepted {
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: viewModel.user?.userImage ?? "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle()) // Clip the image into a circle shape
                            } placeholder: {
                                ProgressView()
                            }
                            VStack(spacing: 5) {
                                HStack{
                                    Image(viewModel.user?.pinType ?? "Lansia")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 76, height: 20)
                                    Spacer()

                                }
                                HStack {
                                    Text("\(viewModel.user?.name ?? "Marcus"), \(viewModel.user?.age ?? "66")")
                                        .fontWeight(.semibold)
                                        .font(.title2)
                                    Image(viewModel.user?.gender ?? "Male")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Spacer()
                                }
                                HStack {
                                    Text(viewModel.user!.location)
                                        .font(.title3)
                                    Spacer()
                                }
                                CupertinoButton("Tunjukkan") {
                                    print("tunjukkan")
                                }
                            }
                        }
                        HStack {
                            Text("Keluhan")
                                .font(.title2)
                            Spacer()
                        }

                        HStack() {
                            Image("Medical")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("Tidak dapat menaiki kereta dengan benar")
                                .font(.title3)
                            Spacer()
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color("backgroundContainer"))
                        .cornerRadius(10)
                        .shadow(radius: 5, x: 5, y : 5)
                        
                        HStack {
                            Text("Kebutuhan")
                                .font(.title2)
                            Spacer()
                        }
                        
                        
                        HStack() {
                            Text(viewModel.user?.needs ?? "Mau Makan")
                                .font(.title3)
                            Spacer()
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color("backgroundContainer"))
                        .cornerRadius(10)
                        .shadow(radius: 5, x: 5, y : 5)
                        
                       Spacer()
                        
                        CupertinoButton("Selesai") {
                            halfSheet = .large
                            detents = fullSheet
                            isDisabled = true
                            isSheetShown = false
                        }
                    }
                }
                Spacer()
            }
            .padding(30)
            .presentationDetents([fullSheet, halfSheet], selection: $detents)
            .interactiveDismissDisabled()
            .presentationBackgroundInteraction(
                .enabled(upThrough: halfSheet)
            )
        }
        .onAppear {
            viewModel.setUserID(userID: self.userID)
            viewModel.getUser()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userID: .constant(0), detents: .constant(.large), isSheetShown: .constant(true), region: .constant(MKCoordinateRegion()))
//            .preferredColorScheme(.dark)
    }
}
