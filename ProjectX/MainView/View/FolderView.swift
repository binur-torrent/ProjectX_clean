//
//  FolderView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 13.03.2026.
//

import SwiftUI

import SwiftUI

struct FolderView: View {
    var folder: Folder
    var body: some View {
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
