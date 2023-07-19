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
    var fullSheet : PresentationDetent = .fraction(0.75)
    
    @State var halfSheet : PresentationDetent = .fraction(0.35)
    @StateObject private var viewModel = UserDetailViewModel()
    
    var body: some View {
        VStack {
            if detents == fullSheet {
                HStack {
                    AsyncImage(url: URL(string: viewModel.getProfileImage())) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle()) // Clip the image into a circle shape
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Image(viewModel.getPinTypeImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle()) // Clip the image into a circle shape
                        
                }
                HStack {
                    Text("Name")
                    Spacer()
                    Text(viewModel.getName())
                }
                
                HStack {
                    Text("Condition")
                    Spacer()
                    Text(viewModel.getCondition())
                }
                
                CupertinoButton("Menuju ke Pengguna") {
                    detents = halfSheet
                }

            } else {
                AsyncImage(url: URL(string: viewModel.getProfileImage())) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle()) // Clip the image into a circle shape
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    Text("Name")
                    Spacer()
                    Text(viewModel.getName())
                }
                
                HStack {
                    Text("Condition")
                    Spacer()
                    Text(viewModel.getCondition())
                }
                CupertinoButton("Selesai") {
                    detents = fullSheet
                    isSheetShown = false
                }
            }
            Spacer()
        }
        .padding(30)
        .presentationDetents([fullSheet, halfSheet], selection: $detents)
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(detents: <#Binding<PresentationDetent?>#>)
//    }
//}
