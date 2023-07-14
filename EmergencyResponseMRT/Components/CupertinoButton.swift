//
//  CupertinoButton.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

//struct CupertinoButton: View {
//    var body: some View {
//        Button(action: {
//
//        }, label: {
//            Text("Halo")
//                .padding(.vertical, 12)
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//        })
//    }
//}
//
//struct CupertinoButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CupertinoButton()
//    }
//}

struct CupertinoButton: View {
    let text: String
    let onTap: () -> Void
    var isDisabled: Bool
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(_ text: String, action: @escaping () -> Void, isDisabled: Bool = false, foregroundColor: Color = .white, backgroundColor: Color = .blue) {
        self.text = text
        self.onTap = action
        self.isDisabled = isDisabled
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(foregroundColor )
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .disabled(isDisabled)
    }
}

struct CupertinoButton_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoButton("Halo", action: {})
    }
}
