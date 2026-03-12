//
//  MainView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var notes: [NoteItem]
    
    var body: some View {
        ZStack{
            NavigationStack {

                List {

                    // Section 1
                    HStack{
                        UploadFileButton(title: "New",
                                         info: "Any filetype",
                                         icon: "document.badge.plus")

                        UploadFileButton(title: "Clear",
                                         info: "Start from scratch",
                                         icon:"text.document")
                    }

                    // Section 2
                    HStack{
                        NewFolderButton()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }

                    // Section 3
                    Button("Add note") {
                        addNote()
                    }

                    // Section 4
                    ForEach(notes) { note in
                        Text(note.name)
                    }
                }

                .navigationTitle("Dashboard")
            }// NavigationStack end
        } // ZStack end
    }
    
    func addNote(){
        // Create a new node, add it to the data context
        let note = NoteItem(name: "First note", type: .note, lastOpened: .now)
        context.insert(note)
    }
}

#Preview {
    ContentView()
}
