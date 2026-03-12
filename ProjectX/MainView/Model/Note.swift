//
//  Note.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 02.03.2026.
//

import Foundation
import SwiftData

enum FileType{
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

enum ItemType{
    case note, folder
}

@Model
class NoteItem: Identifiable {
    
    var id: String
    var name: String
    var type: ItemType
    var lastOpened: Date
    
    var folderId: UUID?
    var file: [URL]?
    var content: String?
    
    init(name: String, type: ItemType, lastOpened: Date,
         folderId: UUID? = nil, file: [URL]? = nil,
         content: String? = nil, fileTypes: [FileType]? = nil) {
        
        self.id = UUID().uuidString
        self.name = name
        self.type = type
        self.lastOpened = lastOpened
        self.folderId = folderId
        self.file = file
    }
}
