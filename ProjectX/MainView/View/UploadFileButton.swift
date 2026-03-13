//
//  UploadFileButtom.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import Foundation
import SwiftUI

struct UploadFileButton: View {
    
    var title: String
    var info: String
    var icon: String
    //var action: () -> Void
    //var onCreate: (String) -> Void
    
    @State private var showPopover: Bool = false
    
    var body: some View {
        Button{
            showPopover = true
        } label: {
            HStack(){
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(Color("bottonPurple"))
                    .padding(6)
                VStack(alignment: .leading){
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                    
                    Text(info)
                        .font(.caption)
                        .foregroundStyle(Color("secondaryGray"))
                        .fontWeight(.regular)
                        .padding(.bottom, 10)
                }
            }
            .padding(5)
        }
        /*.popover(isPresented: $showPopover) {
            PopoverView { name in
                onCreate(name)
                showPopover = false
            }
        }*/
        .frame(width: 180, height: 60, alignment: .leading)
        .background(.gray.opacity(0.15))
        .cornerRadius(10)
    }
}

#Preview {
    UploadFileButton(title: "Some Title", info: "exampleexmpla",
                     icon: "sun.max")
}

/*, action: {print("wronking button")*/
