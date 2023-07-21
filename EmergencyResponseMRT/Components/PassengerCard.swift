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
                
                Text("Ibu Hamil")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(.purple)
                    .clipShape(Capsule())
                   
            }
            .frame(height: 98)
            
            // MARK: User Details
            VStack {
                // MARK: User's Biodata
                HStack {
                    Text("Name")
                        .font(.headline)
                    
                    Text("28")
                        .font(.body)
                    
                    Text("+")
                    
                    Spacer()
                }
                
                //MARK: User's Location
                HStack {
                    Image(systemName: "location.fill")
                    
                    Text("Istora Mandiri")
                    
                    Spacer()
                }
                .font(.caption)
                
                Spacer()
                
                Text("Not Started")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .padding(2)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.red)
                    .clipShape(Capsule())
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
            .padding(.top, 4)
        }
        .frame(width: 173, height: 200)
        .background(.gray)
        .cornerRadius(8)
        
    }
}

struct PassengerCard_Previews: PreviewProvider {
    static var previews: some View {
        PassengerCard()
    }
}
