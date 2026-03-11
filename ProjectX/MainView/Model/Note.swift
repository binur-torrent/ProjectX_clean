//
//  Note.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 02.03.2026.
//

import Foundation

enum FileType{
    case pdf, pptx, docx, link, text, image
}

enum ItemType{
    case note, folder
}

struct LibraryItem: Identifiable{
    var id: UUID = UUID()
    var name: String
    var type: ItemType
    var lastOpened: Date
    
    var folderId: UUID?
    
    var file: URL?
    var content: String?
    var fileType: FileType?
}
