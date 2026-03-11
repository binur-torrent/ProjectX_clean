//
//  OpenNote.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 25.02.2026.
//

import SwiftUI

struct OpenNote: View {
    var title: String
    var subtitle: String
    var isFolder: Bool = false
    
    @State var showPopover: Bool = false
    var body: some View {
        ZStack{
            Button(action: {print("test")}) {
                HStack{
                    Image(systemName: isFolder ? "folder" : "document")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .font(.system(size: 30))
                        .foregroundColor(Color("bottonPurple"))
                        .padding(6)
                    
                    VStack(alignment: .leading){
                        Text(title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text(subtitle)
                            .font(.footnote)
                            .foregroundStyle(Color("secondaryGray"))
                            .padding(.horizontal, 2)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 70, alignment: .trailing)
            .background(.gray.opacity(0.15))
            .cornerRadius(10)
            .padding(.horizontal)
            
            
            HStack{
                Spacer()
                Button(action: {print("delete")}) {
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("bottonPurple"))
                }
                .frame(width: 40, height: 40)
                .padding(.horizontal, 30)
            }
        } // ZStack end
    }
}

#Preview {
    OpenNote(title: "Title", subtitle: "test test")
}
