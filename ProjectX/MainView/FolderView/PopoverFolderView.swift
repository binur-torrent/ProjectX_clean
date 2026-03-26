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
    
    @FocusState private var isTyping: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Text("Create a Folder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                ZStack(alignment: .leading){
                    TextField("", text: $name)
                        .padding(.leading)
                        .frame(height: 60).focused($isTyping)
                        .background(isTyping ? Color("bottonPurple") : Color("secondaryGray"),  in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                        .padding()
                        .autocorrectionDisabled()
                    Text("Frist Name")
                        .padding(.horizontal, 5)
                        .background(.white.opacity(isTyping || !name.isEmpty ? 1 : 0))
                        .foregroundStyle(isTyping || !name.isEmpty ? Color("bottonPurple") : Color("secondaryGray"))
                        .padding(.leading, 30).offset(y: isTyping || !name.isEmpty ? -30 : 0)
                }
                .animation(.linear(duration: 0.2), value: isTyping)
                
                
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
                .background(name.isEmpty ? Color("bottonPurple") : Color("secondaryGray"),  in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            }
        }
        
    }
}

#Preview {
    MainView()
}
