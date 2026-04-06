//
//  LoginView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import SwiftUI

struct LoginView: View {
    
    @State private var name: String = ""
    @State private var secondName: String = ""
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Sign in to App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                DataInputRow(name: $name, text: "Your name")
                DataInputRow(name: $secondName, text: "Second name")
                
            }
        }
    }
}

#Preview {
    LoginView()
}
