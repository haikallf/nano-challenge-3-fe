//
//  PassengerCard.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 19/07/23.
//

import SwiftUI

struct PassengerCard: View {
    let user: UserDetailResponse
    
    var body: some View {
        VStack {
            // MARK: Profile Picture
            ZStack {
                AsyncImage(url: URL(string: user.userImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 98)
                        
                } placeholder: {
                    ProgressView()
                        .frame(height: 98)
                }
                
                VStack {
//                    PassengerStatusTag(isPregnant: user.pinType != "lansia")
                    Image("\(user.pinType == "lansia" ? "lansia" : "bumil")")
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: -4, y: 8)
            }
            
            // MARK: User Details
            VStack {
                // MARK: User's Biodata
                HStack(spacing: 4) {
                    Text(user.name)
                        .font(.headline)
                    
                    Text(user.age)
                        .font(.body)
                    
                    Image("gender-\(user.gender == "male" ? "male" : "female")")
                    
                    Spacer()
                }
                
                //MARK: User's Location
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                    
                    Text(user.location)
                    
                    Spacer()
                }
                .font(.caption)
                
                Spacer()
                
                ResponseStatusTag(responseStatus: user.status)
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

//struct PassengerCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PassengerCard()
//    }
//}
