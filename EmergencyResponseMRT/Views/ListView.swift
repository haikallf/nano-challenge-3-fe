//
//  ListView.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 18/07/23.
//

import SwiftUI
import WrapLayout

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Picker("", selection: $viewModel.selectedItem) {
                        Text("Not Started").tag(0)
                        Text("On Progress").tag(1)
                        Text("Done").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 14)
                    
                    WrapLayout(horizontalSpacing: 11, verticalSpacing: 14) {
                       
                        ForEach(viewModel.users, id: \.self) { user in
                            PassengerCard(user: user)
                        }
                    }
                }
                .padding(.bottom, 72)
                .padding(.horizontal)
            }
            .navigationTitle("Prioritas")
            .background(Color("onBackgroundSecondary"))
            .toolbarBackground(Color("navigationBackground"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewModel.getAllUsers()
            }
            .onReceive(viewModel.$selectedItem) { _ in
                viewModel.getAllUsers()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
