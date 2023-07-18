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
            VStack {
                if (userDefaults.object(forKey: isAdminKey) != nil) {
                    TransitionView()
                } else {
                    LoginView()
                }
                Text("Hello World")
            }
        }
        .onAppear {
            UserDefaults.resetStandardUserDefaults()
            notificationService.askNotificationPermission()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
