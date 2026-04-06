//
//  DataManager.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.03.2026.
//

import Foundation
import SwiftData
import Supabase

class DataManager {
    static func createFolder(name: String, context: ModelContext) {
        let folder = Folder(name: name)
        context.insert(folder)
    }
    
    static func createNote(name: String, folder: Folder?, context: ModelContext) {
        let note = Note(title: name)
        note.folder = folder
        context.insert(note)
    }
    
    
    static func deleteFolder(_ folder: Folder, context: ModelContext) {
        context.delete(folder)
    }
    
    static func deleteNote(_ note: Note, context: ModelContext) {
        context.delete(note)
    }
    
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
