//
//  CupertinoButton.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct CupertinoButton: View {
    let text: String
    let onTap: () -> Void
    var isDisabled: Bool
    var isBordered: Bool
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(_ text: String, action: @escaping () -> Void, isDisabled: Bool = false, isBordered: Bool = false,foregroundColor: Color = .white, backgroundColor: Color = .blue) {
        self.text = text
        self.onTap = action
        self.isDisabled = isDisabled
        self.isBordered = isBordered
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button(action: onTap) {
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
        }
        .disabled(isDisabled)
    }
}

struct CupertinoButton_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoButton("Halo", action: {})
    }
}
