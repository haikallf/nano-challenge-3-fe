//
//  AdminHomeView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct AdminHomeView: View {
    var body: some View {
        VStack {
            
        }
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
