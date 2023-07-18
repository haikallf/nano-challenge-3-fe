//
//  TransitionView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

struct TransitionView: View {
    var body: some View {
        if (UserDefaults.standard.bool(forKey: "isAdmin") == true) {
            AdminHomeView()
        } else {
            UserHomeView()
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
