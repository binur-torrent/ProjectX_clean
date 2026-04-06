//
//  PopoverNoteView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 14.03.2026.
//


import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct PopoverNoteView: View {
    
    var onCreate: (String) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var name: String
    
    @State private var link: String = ""
    
    @State private var showFileImporter: Bool = false
    @State private var showViewer = false
    @State private var selectedFileURLs: [URL] = []
    
    var body: some View {
        ZStack{
            VStack{
                DataInputRow(name: $name, text: "Note Name")
                
                Button {
                    showFileImporter = true
                } label: {
                    Label("Choose file to import", systemImage: "doc.circle")
                        .font(.title)
                        .frame(width: 370, height: 80)
                        .foregroundStyle(.white)
                        .background(Color.black)
                        .cornerRadius(20)
                }
                .fileImporter(isPresented: $showFileImporter,
                              allowedContentTypes: [.data],
                              allowsMultipleSelection: true
                ) { result in
                    switch result {
                    case .success(let files):
                        if !files.isEmpty {
                            selectedFileURLs = files
                            showViewer = true
                            
                            
                            // in case i want to save reopen the files that user selected even after app closed
                                    /*files.forEach { file in
                                        // Get access to the file
                                        let gotAccess = file.startAccessingSecurityScopedResource()
                                        if !gotAccess { return }
                                        
                                        // Stop accessing when scope ends (guarantee)
                                        defer{
                                            file.stopAccessingSecurityScopedResource()
                                        }
                                        do{
                                            let bookmarkData = try file.bookmarkData(options: .minimalBookmark)
                                        }
                                        catch {
                                            print("Failed to create bookmark: \(error.localizedDescription)")
                                        }*/
                            
                            
                        }
                    case .failure(let error): print("File imprter error: \(error)")
                    }
                }
                DataInputRow(name: $link, text: "Your link")
                
                Button{
                    if !name.trimmingCharacters(in: .whitespaces).isEmpty {
                        onCreate(name)
                        name = ""
                        dismiss()
                    }
                }label:{
                    Text("Create Note")
                }
                .frame(width: 370, height: 60)
                .background(name.isEmpty ? Color("buttonPurple") : Color("secondaryGray"),  in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            }
        }
    }
}

#Preview {
    MainView()
}
