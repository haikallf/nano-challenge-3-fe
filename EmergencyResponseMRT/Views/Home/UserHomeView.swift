//
//  UserHomeView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct UserHomeView: View {
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
            
            ReportButton()
//                .frame(width: .infinity, height: .infinity)
                
//                .ignoresSafeArea()
        }
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
