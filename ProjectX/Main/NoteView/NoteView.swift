//
//  NoteView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 13.03.2026.
//

import SwiftUI
import Textual
import SwiftData

struct NoteView: View {
    @Bindable var note: Note
    @State private var isEditing = false

    private let noteFont = Font.system(.body, design: .monospaced)
    
    var body: some View {
        VStack(spacing: 0) {
            if isEditing {
                TextEditor(text: $note.bodyText)
                    .font(noteFont)
                    .lineSpacing(5)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color(.systemBackground))
            } else {
                ScrollView {
                    StructuredText(markdown: note.bodyText)
                        .textual.structuredTextStyle(.gitHub)
                        .textual.textSelection(.enabled)
                        .font(.body)
                        .padding()
                }
                .background(Color(.systemBackground))
            }
        }
        .navigationTitle(note.title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
            }
        }
    }
}
