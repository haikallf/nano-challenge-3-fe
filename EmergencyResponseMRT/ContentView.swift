//
//  ContentView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var isAdmin: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if (isAdmin) {
                    AdminHomeView()
                } else {
                    UserHomeView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
