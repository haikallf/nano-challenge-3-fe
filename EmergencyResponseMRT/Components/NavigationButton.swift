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
    var isDisabled: Bool
    var isBordered: Bool
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(_ text: String, destination: Destination, isDisabled: Bool = false, isBordered: Bool = false, foregroundColor: Color = .white, backgroundColor: Color = .blue) {
        self.text = text
        self.destination = destination
        self.isDisabled = isDisabled
        self.isBordered = isBordered
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        NavigationLink(destination: destination, label: {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(isBordered ? backgroundColor : foregroundColor)
                .background(isBordered ? foregroundColor : backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(!isBordered ? foregroundColor : backgroundColor)
                }
        })
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton("Halo", destination: EmptyView())
    }
}
