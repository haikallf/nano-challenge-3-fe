//
//  LoginView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
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
                        TextField("*******", text: $viewModel.password)
                    }
                }
                .padding(.top, 160)
                
                // MARK:- Action Button
                VStack(spacing: 14) {
                    NavigationButton("Login as User", destination: TransitionView())
                    
                    NavigationButton("Login as Admin", destination: TransitionView(), isBordered: true)
                }
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
