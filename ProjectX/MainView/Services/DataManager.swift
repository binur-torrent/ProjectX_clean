//
//  DataManager.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.03.2026.
//

import Foundation
import SwiftData

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
}
