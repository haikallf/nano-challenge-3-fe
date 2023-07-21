//
//  BottomNavigationBar.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 19/07/23.
//

import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedViewIndex: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            
            VStack(spacing: 7) {
                Image(systemName: "staroflife.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                    .foregroundColor(selectedViewIndex == 1 ? .red : .gray)
                    
                
                Text("Prioritas")
                    .font(.system(size: 10))
                    .foregroundColor(selectedViewIndex == 1 ? .red : .gray)
            }
            .onTapGesture {
                selectedViewIndex = 1
            }
            
            Spacer()
            Spacer()
            
            VStack(spacing: 7) {
                Image(systemName: "map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                    .foregroundColor(selectedViewIndex == 2 ? .red : .gray)
                    
                
                Text("Peta")
                    .font(.system(size: 10))
                    .foregroundColor(selectedViewIndex == 2 ? .red : .gray)
            }
            .onTapGesture {
                selectedViewIndex = 2
            }
            
            Spacer()
        }
        .padding(.top)
        .padding(.horizontal, 24)
        .background(Color("onBackground"))
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar(selectedViewIndex: .constant(1))
    }
}
