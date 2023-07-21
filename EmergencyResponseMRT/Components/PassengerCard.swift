//
//  PassengerCard.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 19/07/23.
//

import SwiftUI

struct PassengerCard: View {
    var body: some View {
        VStack {
            // MARK: Profile Picture
            ZStack {
                Rectangle()
                    .frame(height: 98)
                
                VStack {
                    Text("Ibu Hamil")
                        .padding(.vertical, 4)
                        .padding(.horizontal, 12)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(.purple)
                        .clipShape(Capsule())
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: -4, y: 8)
            }
            
            // MARK: User Details
            VStack {
                // MARK: User's Biodata
                HStack(spacing: 4) {
                    Text("Name")
                        .font(.headline)
                    
                    Text("28")
                        .font(.body)
                    
                    Image("gender-female")
                    
                    Spacer()
                }
                
                //MARK: User's Location
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                    
                    Text("Istora Mandiri")
                    
                    Spacer()
                }
                .font(.caption)
                
                Spacer()
                
                ResponseStatusTag(responseStatus: "not_started")
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
            .padding(.top, 4)
            .background(Color("cardBackground"))
        }
        .frame(width: 173, height: 200)
        .cornerRadius(8)
    }
}

struct PassengerCard_Previews: PreviewProvider {
    static var previews: some View {
        PassengerCard()
    }
}
