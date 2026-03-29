//
//  Profile.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 28.03.2026.
//

import Foundation
import Supabase

let client = SupabaseClient(supabaseURL: URL(string: "https://ibumfhrrqjtbsxlahrki.supabase.co")!, supabaseKey: "sb_publishable_cpG3MgZEko3wvtaiOkNvAA_Mf2tg4ZN")

class Profile: Encodable{
    var id: UUID
    var name: String
    var email: String
    var phone: String?
    var university: String?
    
    init(id: UUID){
        self.id = id
    }
}

struct insertUser{
    var profile: Profile
    

}
