//
//  PopoverView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 04.03.2026.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct PopoverView: View {
    
    
    @State private var noteName: String = ""
    
    @State private var showFileImporter: Bool = false
    @State private var showViewer = false
    @State private var selectedFileURLs: [URL] = []
    
    var body: some View {
        ZStack{
            VStack{
                Button {
                    showFileImporter = true
                } label: {
                    Label("Choose file to import", systemImage: "doc.circle")
                        .font(Font.title.bold())
                        .frame(width: 300, height: 100)
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
            }
        }
        
    }
}

#Preview {
    PopoverView()
}
