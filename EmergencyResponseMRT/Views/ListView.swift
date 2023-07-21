//
//  ListView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI
import WrapLayout

struct ListView: View {
    @State private var selectedItem = 0
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Picker("", selection: $selectedItem) {
                        Text("Not Started").tag(0)
                        Text("On Progress").tag(1)
                        Text("Done").tag(2)
                    }
                    .pickerStyle(.segmented)
                    
                    WrapLayout {
                        PassengerCard()
                        
                        PassengerCard()
                        
                        PassengerCard()
                    }
                }
                .padding(.bottom, 72)
                .padding(.horizontal)
            }
            .navigationTitle("Emergency")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
