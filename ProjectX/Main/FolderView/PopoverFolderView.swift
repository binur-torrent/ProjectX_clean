//
//  PopoverView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 04.03.2026.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct PopoverFolderView: View {
    
    var onCreate: (String) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var name: String
    
    @State private var showFileImporter: Bool = false
    @State private var showViewer = false
    @State private var selectedFileURLs: [URL] = []
    
    var body: some View {
        ZStack{
            VStack{
                Text("Create a Folder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                DataInputRow(name: $name, text: "Folder Name")
                
                
                Button{
                    if !name.trimmingCharacters(in: .whitespaces).isEmpty {
                        onCreate(name)
                        name = ""
                        dismiss()
                    }
                }label:{
                    Text("Create Folder")
                }
                .frame(width: 370, height: 60)
                .foregroundStyle(.white)
                .background(!name.isEmpty ? Color("buttonPurple") : Color("buttonPurpleSecond"), in: RoundedRectangle(cornerRadius: 10))
                
            }
        }
        
    }
}

#Preview {
    MainView()
}
