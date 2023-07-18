//
//  ContentView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var isAdmin: Bool = false
    @StateObject var notificationService = NotificationService()
    
    let userDefaults = UserDefaults.standard
    let isAdminKey = "isAdmin"
    
    var body: some View {
        NavigationView {
            if (userDefaults.object(forKey: isAdminKey) != nil) {
                if (userDefaults.bool(forKey: isAdminKey) == true) {
                    AdminHomeView()
                } else {
                    UserHomeView()
                }
            } else {
                VStack {
                    Text("Welcome to MRT's Emergency Response App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        NavigationButton("Admin", destination: AdminHomeView(), action: {})
                        
                        NavigationButton("User", destination: UserHomeView(), action: {})
                    }
                }
                .padding()
            }
        }
        .onAppear {
            notificationService.askNotificationPermission()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
