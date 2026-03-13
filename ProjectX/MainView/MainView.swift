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
    @Query var folders: [Folder]
    
    var body: some View {
        ZStack{
            NavigationStack {
                ScrollView{
                    HStack{
                        UploadFileButton(title: "New",
                                         info: "Any filetype",
                                         icon: "document.badge.plus",
                                         //action: {addNote()}
                        )

                        UploadFileButton(title: "Clear",
                                         info: "Start from scratch",
                                         icon:"text.document",
                                         //action: {print("folder is created")}
                        )
                    }

                    // Section 2
                    HStack{
                        NewFolderButton()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    // Section 3
                    ForEach(folders) { folder in
                        NavigationLink(folder.name) {
                            FolderView(folder: folder)
                        }
                    }

                    
                }
                .navigationTitle("Dashboard")
            }
            // NavigationStack end
        } // ZStack end
    }
    
    func addNote(name: String, folder: Folder?) {

        let note = Note(title: name)

        note.folder = folder

        context.insert(note)
    }
    
    func addFolder(name: String) {

        let folder = Folder(name: name)

        context.insert(folder)
    }
    
    func addAttachment(url: URL, to note: Note) {

        let file = Attachment(
            fileURL: url,
            type: .pdf
        )

        file.note = note

        context.insert(file)
    }
}

#Preview {
    ContentView()
}
