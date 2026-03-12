//
//  MainView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) private var context
    @State private var newName: String = ""
    
    var body: some View {
        ZStack{
            NavigationStack{
                ScrollView{
                    VStack{
                        HStack{
                            UploadFileButton(title: "New",
                                             info: "Any filetype",
                                             icon: "document.badge.plus")
                            UploadFileButton(title: "Clear",
                                             info: "Start from scratch",
                                             icon:"text.document")
                        }
                    }
                    HStack{
                        NewFolderButton()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding()
                    
                    VStack{
                        
                    }
                }
                .navigationTitle("Dashboard")
                .background(Color.white)//primary.opacity(0.07)
                // scroll view end
            } // main VStack end
        } // ZStack end
    }
}

#Preview {
    ContentView()
}
