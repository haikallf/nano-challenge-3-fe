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
                    Text("Haikal Lazuardi")
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
        .navigationBarBackButtonHidden()
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}


