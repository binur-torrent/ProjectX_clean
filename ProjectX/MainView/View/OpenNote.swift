//
//  OpenNote.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 25.02.2026.
//

import SwiftUI

struct OpenNote<Destination: View>: View { // Added Generic Destination
    var title: String
    var subtitle: String
    var isFolder: Bool = false
    var destination: Destination // The view to navigate to
    
    // var onDelete: () -> Void // Closure to handle delete
    
    var body: some View {
        ZStack {
            // 1. The main navigation area
            NavigationLink(destination: destination) {
                HStack {
                    Image(systemName: isFolder ? "folder.fill" : "doc.text.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("bottonPurple"))
                        .padding(6)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text(subtitle)
                            .font(.footnote)
                            .foregroundStyle(Color("secondaryGray"))
                    }
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(10)
            }
            .buttonStyle(.plain) // Keeps the styling from looking like a default blue link
            .padding(.horizontal)
            
            // 2. The Delete Button
            HStack {
                Spacer()
                Button(action: {print("deleted")}) {
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("bottonPurple"))
                }
                .frame(width: 44, height: 44)
                .padding(.trailing, 30)
            }
        }
    }
}
