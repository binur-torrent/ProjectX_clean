//
//  DataInputRow.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import SwiftUI

struct DataInputRow: View {
    
    @Binding var name : String
    @FocusState var isTyping : Bool
    
    var text: String
    
    var body: some View {
        ZStack(alignment: .leading){
            TextField("", text: $name)
                .padding(.leading)
                .frame(height: 60).focused($isTyping)
                .background(isTyping ? Color("buttonPurple") : Color("secondaryGray"),  in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .padding()
                .autocorrectionDisabled()
            Text(text)
                .padding(.horizontal, 5)
                .background(.white.opacity(isTyping || !name.isEmpty ? 1 : 0))
                .foregroundStyle(isTyping || !name.isEmpty ? Color("buttonPurple") : Color("secondaryGray"))
                .padding(.leading, 30).offset(y: isTyping || !name.isEmpty ? -30 : 0)
        }
        .animation(.linear(duration: 0.2), value: isTyping)
    }
}
