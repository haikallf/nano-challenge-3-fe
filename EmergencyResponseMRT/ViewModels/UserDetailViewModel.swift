//
//  UserDetailViewModel.swift
//  EmergencyResponseMRT
//
//  Created by Jonathan Axel Benaya on 19/07/23.
//

import Foundation

class UserDetailViewModel : ObservableObject {
    @Published var user: User = User.all[1]
    @Published var name: String = ""
    @Published var pinType: String = ""
    @Published var profileImage: String = ""
    
    
    
//    init(otherUsers: [User], name: String, pinType: String, profileImage: String) {
//        self.otherUsers = otherUsers
//        self.name = otherUsers[1].name
//        self.pinType = otherUsers[1].pinType
//        self.profileImage = otherUsers[1].urlImg
//    }
    
    func getName() -> String {
        return user.name
    }
    
    func getPinType() -> String {
        return user.pinType
    }
    
    func getProfileImage() -> String {
        return user.urlImg
    }
    
    func getPinTypeImage() -> String {
        switch(user.pinType) {
        case "blue" :
            return "PregnantWoman"
        case "red" :
            return "Elderly"
        default :
            return "PregnantWoman"
        }
    }
    
    func getCondition() -> String {
        switch(user.pinType) {
        case "blue" :
            return "Ibu Hamil"
        case "red" :
            return "Lansia"
        default :
            return "Ibu Hamil"
        }
    }
}
