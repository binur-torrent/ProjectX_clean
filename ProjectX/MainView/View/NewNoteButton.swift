//
//  NewNoteButton.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 14.03.2026.
//


import SwiftUI
import SwiftData

struct NewNoteButton: View {
    
    @Environment(\.modelContext) private var context
    
    var folder: Folder?
    
    @State private var showPopover = false
    @State private var name: String = ""
    
    var body: some View {
        Button{
            showPopover = true
        }label: {
            Label("New Note", systemImage: "folder.badge.plus")
        }
        .popover(isPresented: $showPopover){
            PopoverNoteView(
                onCreate: { name in
                    addNote(name: name, folder: folder)
                },
                name: $name
            )        }
        .frame(width: 130, height: 60)
        .foregroundStyle(Color("secondaryGray"))
        .background(.gray.opacity(0.15))
        .cornerRadius(7)
        .overlay{
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color("secondaryGray"), lineWidth: 0.5)
        }
        .padding()
        
    }
    
    func addNote(name: String, folder: Folder?) {
        let note = Note(title: name)
        note.folder = folder
        context.insert(note)
    }
}

#Preview {
    NewFolderButton()
}
