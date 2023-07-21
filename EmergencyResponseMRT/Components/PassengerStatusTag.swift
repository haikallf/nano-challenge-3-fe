//
//  PassengerStatusTag.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 21/07/23.
//

import SwiftUI

struct PassengerStatusTag: View {
    let isPregnant: Bool
    
    var body: some View {
        Text(isPregnant ? "Ibu Hamil" : "Lansia")
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(isPregnant ? .purple : .indigo)
            .clipShape(Capsule())
    }
}

struct PassengerStatusTag_Previews: PreviewProvider {
    static var previews: some View {
        PassengerStatusTag(isPregnant: false)
    }
}
