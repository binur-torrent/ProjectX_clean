//
//  FolderView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 13.03.2026.
//

import SwiftUI
import SwiftData

struct FolderView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var notes: [Note]
    var folder: Folder
    
    @State private var showPopover: Bool = false
    
    init(folder: Folder) {
        self.folder = folder
        
        // This filter ensures we only see notes linked to this folder ID
        let folderID = folder.id
        _notes = Query(filter: #Predicate<Note> { note in
            note.folder?.id == folderID
        }, sort: \Note.createdAt)
    }
    
    var body: some View {
        ZStack{
            NavigationStack{
                ScrollView(.vertical, showsIndicators: false){
                    NewNoteButton(folder: folder)
                    ForEach(notes){ note in
                        OpenNote(title: note.title,
                                 subtitle: note.createdAt.formatted(date: .abbreviated, time: .omitted),
                                 isFolder: false,
                                 destination: NoteView(note: note),
                                 action: {DataManager.deleteNote(_: note, context: context)})
                    }
                }
            }
        }

    }
    
    func addNote(name: String, folder: Folder?) {
        let note = Note(title: name)
        note.folder = folder
        context.insert(note)
    }
}
