//
//  LoginView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import SwiftUI

struct LoginView: View {
    
    @State private var mail: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Sign In to App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                DataInputRow(name: $mail, text: "Your name")
                DataInputRow(name: $password, text: "Second name")
                
            }
        }
    }
}

#Preview {
    LoginView()
}
