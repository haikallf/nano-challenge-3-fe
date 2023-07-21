//
//  LoginView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var shouldNavigate: Bool = false
    let isAdmin: Bool
    
    var body: some View {
        ZStack {
            VStack {
                // MARK:- Page Logo
               Image("SRS-Logo")
                
                Spacer()
            }
            .padding(.top, 66)
            
            VStack(spacing: 14) {
                // MARK:- Email Field
                HStack(spacing: 14) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    
                    TextField("Email", text: $viewModel.email)
                        .font(.headline)
                        .textInputAutocapitalization(.never)
                }
                .padding(.vertical)
                .padding(.horizontal, 12)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray)
                }
                
                // MARK:- Password Field
                HStack(spacing: 14) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 17, height: 24)
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: $viewModel.password)
                        .font(.headline)
                        .textInputAutocapitalization(.never)
                }
                .padding(.vertical)
                .padding(.horizontal, 12)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray)
                }
                
                // MARK:- Login Button
                CupertinoButton("LOGIN", action: {
                    viewModel.isAdmin = isAdmin
                    viewModel.login()
                })
            }
            
            //MARK: Navigate to TransitionView triggered by shouldNavigate
            NavigationLink(destination: TransitionView(), isActive: $viewModel.shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAdmin: false)
    }
}
