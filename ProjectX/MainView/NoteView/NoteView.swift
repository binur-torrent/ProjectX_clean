//
//  NoteView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 13.03.2026.
//

import SwiftUI

struct NoteView: View {
    @State var note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
            ForEach($note.contents, id: \.self) { $content in
                HStack{
                    switch content.type {
                    case FileType.pdf: Text("Something")
                    case FileType.docx: Text("Something2")
                    default:
                        TextField("Plain text...", text: $content.text)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Note")
    }
}
