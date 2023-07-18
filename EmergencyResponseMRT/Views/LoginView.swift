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
    
    var body: some View {
        ZStack {
            VStack {
                // MARK:- Page Title
                Text("Welcome to MRT's Emergency Response App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 52)
                
                Spacer()
            }
            
            VStack(spacing: 48) {
                // MARK:- Login Forms
                HStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Email")
                        Text("Password")
                    }
                    
                    VStack(spacing: 16) {
                        TextField("exampleemail.com", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("*******", text: $viewModel.password)
                    }
                }
                .padding(.top, 160)
                
                // MARK:- Action Button
                VStack(spacing: 14) {
                    CupertinoButton("Login as User", action: {
                        viewModel.isAdmin = false
                        viewModel.login()
                        shouldNavigate = true
                    })
                    
                    CupertinoButton("Login as Admin", action: {
                        viewModel.isAdmin = true
                        viewModel.login()
                        shouldNavigate = true
                    }, isBordered: true)
                }
            }
            
            //MARK: Navigate to TransitionView triggered by shouldNavigate
            NavigationLink(destination: TransitionView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
