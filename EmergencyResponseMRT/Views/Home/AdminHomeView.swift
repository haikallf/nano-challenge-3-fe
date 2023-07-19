//
//  AdminHomeView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct AdminHomeView: View {
    @State var selectedView: Int = 1
    var body: some View {
        ZStack {
            if selectedView == 1 {
                ListView()
            } else if selectedView == 2 {
                MapView()
            }
            
            VStack {
                Spacer()
                
                BottomNavigationBar(selectedViewIndex: $selectedView)
            }
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
