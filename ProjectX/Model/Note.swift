//
//  Note.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 02.03.2026.
//

import Foundation
import SwiftData

enum FileType: String, Codable{
    case pdf, pptx, docx, link, text, image, unknown
    
    var iconName: String {
        switch self {
        case .pdf: return "doc.richtext"
        case .pptx: return "chart.pie.doc.fill"
        case .docx: return "doc.text.fill"
        case .text: return "doc.plaintext"
        case .image: return "photo"
        case .link: return "link"
        case .unknown: return "doc.fill"
        }
    }
}

enum ItemType: String, Codable{
    case note, folder
}

@Model
class NoteContent: Identifiable {
    var id: UUID
    var text: String
    var isDone: Bool
    var type: FileType
    var order: Int
    
    var note: Note?

    init(text: String, type: FileType = .text, order: Int = 0) {
        self.id = UUID()
        self.text = text
        self.isDone = false
        self.type = type
        self.order = order
    }
}

@Model
class Note: Identifiable {

    var id: UUID
    var title: String
    var createdAt: Date
    var folder: Folder?
    
    @Relationship(deleteRule: .cascade)
    var contents: [NoteContent]

    init(title: String, content: String = "") {
        self.id = UUID()
        self.title = title
        self.createdAt = .now
        self.contents = []
    }
}

@Model
class Folder: Identifiable {

    var id: UUID
    var name: String
    
    @Relationship(deleteRule: .cascade)
    var notes: [Note]

    init(name: String) {
        self.id = UUID()
        self.name = name
        self.notes = []
    }
}
