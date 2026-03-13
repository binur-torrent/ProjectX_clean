//
//  NewFolderButton.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 25.02.2026.
//

import SwiftUI

struct NewFolderButton: View {
    
    var body: some View {
        Button(action: {print("create new folder")}, label: {
            Label("New Folder", systemImage: "folder.badge.plus")
        })
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
}

#Preview {
    NewFolderButton()
}
