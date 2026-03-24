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
    @Query var notes: [Note]
    var folder: Folder
    
    @State private var showPopover: Bool = false
    
    var body: some View {
        
        
        ZStack{
            NavigationStack{
                ScrollView(.vertical, showsIndicators: false){
                    NewNoteButton()
                    
                    List {
                        ForEach(folder.notes) { note in
                            NavigationLink(note.title) {
                                NoteView(note: note)
                            }
                        }
                    }
                    .navigationTitle(folder.name)
                    
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
