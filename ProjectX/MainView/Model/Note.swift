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
class Attachment: Identifiable {

    var id: UUID
    var fileURL: URL
    var type: FileType
    
    var note: Note?

    init(fileURL: URL, type: FileType) {
        self.id = UUID()
        self.fileURL = fileURL
        self.type = type
    }
}

@Model
class Note: Identifiable {

    var id: UUID
    var title: String
    var content: String
    var createdAt: Date
    
    var folder: Folder?
    
    @Relationship(deleteRule: .cascade)
    var attachments: [Attachment]

    init(title: String, content: String = "") {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = .now
        self.attachments = []
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
