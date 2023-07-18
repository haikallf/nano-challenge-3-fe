//
//  ReportButton.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi Fadil on 14/07/23.
//

import SwiftUI

struct ReportButton: View {
    @State var radius: CGFloat = 0
    @State var isLoading: Bool = false
    
    let onTap: () -> Void
    
    init(action: @escaping () -> Void) {
        self.onTap = action
    }
    
    var animation: Animation {
        Animation.easeInOut(duration: 0.8)
            .repeatForever(autoreverses: true)
    }
    
    var body: some View {
        Button(action: onTap, label: {
            Text("Ask for help")
                .padding(100)
                .background(.red)
                .foregroundColor(.white)
                .font(.largeTitle)
                .clipShape(Circle())
                .shadow(color: .red, radius: isLoading ? 20 : 0)
                .onAppear {
                    DispatchQueue.main.async {
                        withAnimation(animation) {
                            self.isLoading.toggle()
                        }
                    }
                }
        })
    }
}

struct ReportButton_Previews: PreviewProvider {
    static var previews: some View {
        ReportButton(action: {})
    }
}
