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
    
    static func addAttachment(url: URL, to note: Note, context: ModelContext) {
        let file = Attachment(fileURL: url, type: .unknown)
        file.note = note
        context.insert(file)
    }
}
