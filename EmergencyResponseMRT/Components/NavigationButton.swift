//
//  NavigationButton.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

struct NavigationButton<Destination: View>: View {
    let text: String
    let destination: Destination
    let onTap: () -> Void
    var isDisabled: Bool
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(_ text: String, destination: Destination, action: @escaping () -> Void, isDisabled: Bool = false, foregroundColor: Color = .white, backgroundColor: Color = .blue) {
        self.text = text
        self.destination = destination
        self.onTap = action
        self.isDisabled = isDisabled
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {

        NavigationLink(destination: destination, label: {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(foregroundColor )
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
        })
    }
}

struct navigationButton_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoButton("Halo", action: {})
    }
}
