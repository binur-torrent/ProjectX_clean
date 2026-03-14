//
//  NewFolderButton.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 25.02.2026.
//

import SwiftUI
import SwiftData

struct NewFolderButton: View {
    
    @Environment(\.modelContext) private var context
    @Query var folders: [Folder]
    
    @State private var showPopover = false
    @State private var name: String = ""
    
    var body: some View {
        Button{
            showPopover = true
        }label: {
            Label("New Folder", systemImage: "folder.badge.plus")
        }
        .popover(isPresented: $showPopover){
            
            PopoverView(onCreate: addFolder, name: $name)
        }
        .frame(width: 130, height: 60)
        .foregroundStyle(Color("secondaryGray"))
        .background(.gray.opacity(0.15))
        .cornerRadius(7)
        .overlay{
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color("secondaryGray"), lineWidth: 0.5)
        }
        .padding()
        
    }
    
    
    func addFolder(name: String) {
        let folder = Folder(name: name)
        context.insert(folder)
    }
}

#Preview {
    NewFolderButton()
}
