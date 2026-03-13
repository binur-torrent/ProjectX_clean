//
//  NoteView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 13.03.2026.
//

import SwiftUI

struct NoteView: View {
    var note: Note
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
            TextEditor(text: .constant(note.content))
                .padding()
            List {
                ForEach(note.attachments) { file in
                    Text(file.fileURL.lastPathComponent)
                }
            }
        }
        .navigationTitle("Note")
    }
}
