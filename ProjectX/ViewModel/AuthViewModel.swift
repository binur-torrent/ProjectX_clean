//
//  AuthViewModel.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import Foundation
import Supabase

class AuthViewModel{ // should be ObservableObject
    
    static func insertProfile(_ user: User) async throws {
        try await supabase
            .from("users")
            .insert(user)
            .execute()
    }
    
    static func updateProfile(_ user: User, column: String, to value: String) async throws {
        try await supabase
            .from("users")
            .update([column: value])
            .eq("id", value: user.id)
            .execute()
    }
    
    static func deleteProfile(_ user: User) async throws {
        try await supabase
            .from("users")
            .delete()
            .eq("id", value: user.id)
            .execute()
    }
}
