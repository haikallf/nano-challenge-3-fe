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
            HStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Nama")
                        Text("Kondisi")
                        Text("Stasiun")
                    }
                    
                    VStack(alignment: .leading) {
                        Text(": Melinda")
                        Text(": Ibu Hamil")
                        Text(": Lebak Bulus")
                    }
                }
                
                Spacer()
                
                Text("05.00")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray)
        .cornerRadius(8)
        
    }
}

struct PassengerCard_Previews: PreviewProvider {
    static var previews: some View {
        PassengerCard()
    }
}
