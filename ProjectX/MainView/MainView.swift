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
                    // Section 2
                    HStack{
                        NewFolderButton()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    // Section 3
                    ForEach(folders) { folder in
                        OpenNote(
                            title: folder.name,
                            subtitle: "\(folder.notes.count) items",
                            isFolder: true,
                            destination: FolderView(folder: folder), // Passing the view here
                            action: {DataManager.deleteFolder(_: folder, context: context)}
                        )
                    }

                    
                }
                .navigationTitle("Dashboard")
            }
            // NavigationStack end
        } // ZStack end
    }
}

#Preview {
    ContentView()
}
