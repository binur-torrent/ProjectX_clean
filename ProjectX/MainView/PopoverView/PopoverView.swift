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
    
    
    var body: some View {
        ZStack{
            VStack{
                TextField("Note Name", text: $noteName)
                    .frame(width: 300, height: 50)
                    .border(Color.black)
                    .padding()
                VStack{
                    chooseFileType(type: text)
                    chooseFileType(type: pdf)
                }
            }
        }
        
    }
}

struct chooseFileType: View{
    @State private var presentImporter = false
    
    var type: FileType
    
    var body: some View {
        Button(Text(buttonTitle(for: type))){
            presentImporter = true
        }.fileImporter(isPresented: $presentImporter,
                       allowedContentTypes: [type]){ result in
            switch result{
            case .success(let url): print(url)
            case .failure(let error): print(error)
            }
        }
    }
}

#Preview {
    PopoverView()
}
