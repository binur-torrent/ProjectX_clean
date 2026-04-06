//
//  ContinueButton.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import SwiftUI

struct ContinueButton: View {
    @Binding var name: String
    
    var body: some View {
        Button{
            if !name.trimmingCharacters(in: .whitespaces).isEmpty {
                onCreate(name)
                name = ""
                dismiss()
            }
        }label:{
            Text("Create Note")
        }
        .frame(width: 370, height: 60)
        .background(name.isEmpty ? Color("buttonPurple") : Color("secondaryGray"),  in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
    }
}

#Preview {
    ContinueButton()
}
