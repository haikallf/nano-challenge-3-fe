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
                Image(systemName: "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                    .foregroundColor(selectedViewIndex == 1 ? .blue : .gray)
                    
                
                Text("List")
                    .font(.system(size: 10))
                    .foregroundColor(selectedViewIndex == 1 ? .blue : .gray)
            }
            .onTapGesture {
                selectedViewIndex = 1
            }
            
            Spacer()
            Spacer()
            
            VStack(spacing: 7) {
                Image(systemName: "map.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                    .foregroundColor(selectedViewIndex == 2 ? .blue : .gray)
                    
                
                Text("List")
                    .font(.system(size: 10))
                    .foregroundColor(selectedViewIndex == 2 ? .blue : .gray)
            }
            .onTapGesture {
                selectedViewIndex = 2
            }
            
            Spacer()
        }
        .padding(.top)
        .padding(.horizontal, 24)
        .background(.white)
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar(selectedViewIndex: .constant(1))
    }
}
