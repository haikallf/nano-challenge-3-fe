//
//  UserDetailView.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 19/07/23.
//

import SwiftUI


struct UserDetailView: View {
    
    @Binding var detents : PresentationDetent
    @Binding var isSheetShown : Bool
    @State var isDisabled : Bool = true
    @State var terima : Bool = false
    
    var fullSheet : PresentationDetent = .large
    @State var halfSheet : PresentationDetent = .large
    @StateObject private var viewModel = UserDetailViewModel()
    
    var body: some View {
        ZStack {
            Color("backgroundSheet")
                .ignoresSafeArea()
            VStack (spacing: 5){
                if detents == fullSheet && !terima {
                    HStack{
                        Image("Lansia")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76, height: 20)

                    }
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
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
                        Text("Marcus")
                            .fontWeight(.semibold)
                            .font(.title)
                        Spacer()
                    }
                   
                    
                    HStack{
                        Spacer()
                        Text("66")
                            .fontWeight(.semibold)
                            .font(.title)
                        Image("Male")
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
                        Text("Membutuhkan bantuan dikarenakan susah untuk berjalan")
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
                        terima = true
                        halfSheet = .fraction(0.35)
                        detents = halfSheet
                        isDisabled = false
                    }

                } else if detents == halfSheet && terima {
                    HStack{
                        AsyncImage(url: URL(string: "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
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
                                Image("Lansia")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 76, height: 20)
                                Spacer()

                            }
                            HStack {
                                Text("Marcus, 66")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                Image("Male")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Spacer()
                            }
                            HStack {
                                Text("Blok M, Concourse")
                                    .font(.title3)
                                Spacer()
                            }
                            CupertinoButton("Tunjukkan") {
                                print("tunjukkan")
                            }
                        }
                    }
                    
                } else if detents == fullSheet && terima {
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")) { image in
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
                                    Image("Lansia")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 76, height: 20)
                                    Spacer()

                                }
                                HStack {
                                    Text("Marcus, 66")
                                        .fontWeight(.semibold)
                                        .font(.title2)
                                    Image("Male")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Spacer()
                                }
                                HStack {
                                    Text("Blok M, Concourse")
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
                            Text("Membutuhkan bantuan dikarenakan susah untuk berjalan")
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
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(detents: .constant(.large), isSheetShown: .constant(true))
            .preferredColorScheme(.dark)
    }
}
