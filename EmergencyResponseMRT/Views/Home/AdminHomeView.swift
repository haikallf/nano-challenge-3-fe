//
//  AdminHomeView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct AdminHomeView: View {
    @State var selectedView: Int = 0
    var body: some View {
        VStack {
            TabView(selection: $selectedView) {
                ListView()
                    .tabItem{
                        Label("List",systemImage: "list.bullet")
                    }
                    .tag(0)
                
                MapView()
                    .tabItem{
                        Label("Map",systemImage: "map.fill")
                    }
                    .tag(1)
            }
            .background(.white)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            UserDefaults.standard.set(true, forKey: "isAdmin")
        }
    }
}

struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
    }
}
