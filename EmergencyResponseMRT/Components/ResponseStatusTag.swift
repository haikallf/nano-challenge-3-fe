//
//  ResponseStatusTag.swift
//  EmergencyResponseMRT
//
//  Created by Haikal Lazuardi on 21/07/23.
//

import SwiftUI

struct ResponseStatusTag: View {
    let responseStatus: String
    
    func getStatusTag() -> (String, Color) {
        switch responseStatus {
        case "fine":
            return ("Not Started", .blue)
        case "assisted":
            return ("On Progress", .yellow)
        case "requesting":
            return ("Requesting", .red)
        case "done":
            return ("Done", .green)
        default:
            return ("Not Available", .black)
        }
    }
    
    var body: some View {
        Text(getStatusTag().0)
            .font(.caption2)
            .fontWeight(.bold)
            .padding(2)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(getStatusTag().1)
            .clipShape(Capsule())
    }
}

struct ResponseStatusTag_Previews: PreviewProvider {
    static var previews: some View {
        ResponseStatusTag(responseStatus: "not_started")
    }
}
