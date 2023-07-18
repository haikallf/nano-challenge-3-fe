//
//  ListView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            VStack {
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
                
                PassengerCard()
            }
            .padding(.bottom, 72)
            .padding(.horizontal)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
