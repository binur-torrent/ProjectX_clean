//
//  Profile.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 28.03.2026.
//

import Foundation
import Supabase

struct User: Identifiable, Codable {
    var id: String
    var fullname: String
    var email: String
    var phone: String?
    var university: String?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: " Michael Jordan", email: "michael.jordan@binur.com")
}
