//
//  PreLoginView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 20/07/23.
//

import SwiftUI

struct PreLoginView: View {
    @State var isAdmin: Bool = false
    @State var shouldNavigate: Bool = false
    
    var body: some View {
        ZStack {
            // MARK:- MRT Logo
            VStack {
                Image("MRTJ-Logo")
                
                Spacer()
            }
            .padding(.top, 66)
            
            // MARK:- Account Selection
            HStack(spacing: 14) {
                VStack(spacing: 12) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 132, height: 132)
                    
                    Text("USER")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color("mrtblue"))
                .onTapGesture {
                    isAdmin = false
                    shouldNavigate = true
                }
                
                VStack(spacing: 12) {
                    Image(systemName: "person.badge.shield.checkmark.fill")
                        .resizable()
                        .frame(width: 60, height: 64)
                        .padding(.vertical, 34)
                        .padding(.horizontal, 36)
                        .overlay {
                            Circle()
                                .stroke(Color("mrtblue"), lineWidth: 3)
                                .frame(width: 132, height: 132)
                        }
                    
                    Text("ADMIN")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color("mrtblue"))
                .onTapGesture {
                    isAdmin = true
                    shouldNavigate = true
                }
            }
            
            //MARK: Navigate to LoginView triggered by shouldNavigate
            NavigationLink(destination: LoginView(isAdmin: isAdmin), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
    }
}

struct PreLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PreLoginView()
    }
}
