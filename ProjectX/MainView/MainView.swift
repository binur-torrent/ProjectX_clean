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
                                         icon: "document.badge.plus"
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
                    /*ForEach(folders) { folder in
                        OpenNote(title: folder.name,
                                 subtitle: "Something",
                                 isFolder: true,
                                 navigation: FolderView(folder: folder)
                        )
                        /*
                        NavigationLink(folder.name) {
                            FolderView(folder: folder)
                        }
                         */
                    }*/
                    
                    ForEach(folders) { folder in
                        OpenNote(
                            title: folder.name,
                            subtitle: "\(folder.notes.count) items",
                            isFolder: true,
                            destination: FolderView(folder: folder), // Passing the view here
                        )
                    }

                    
                }
                .navigationTitle("Dashboard")
            }
            // NavigationStack end
        } // ZStack end
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
