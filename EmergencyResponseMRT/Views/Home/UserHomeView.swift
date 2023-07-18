//
//  UserHomeView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct UserHomeView: View {
    @StateObject var notificationService = NotificationService()
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Halo,")
                    Text(UserDefaults.standard.string(forKey: "email") ?? "NULL")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
            }
            .padding()
            
            ReportButton(action: {
                notificationService.sendNotification(title: "This is title", body: "This is body")
            })
        }
        .onAppear {
            UserDefaults.standard.set(false, forKey: "isAdmin")
        }
        .navigationBarBackButtonHidden()
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}


