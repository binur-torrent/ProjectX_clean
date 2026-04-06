//
//  RegistrationView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var mail: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Sign Un")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                DataInputRow(name: $mail, text: "Email Address")
                DataInputRow(name: $name, text: "Your Name")
                DataInputRow(name: $password, text: "Password")
                DataInputRow(name: $confirmPassword, text: "Confirm Password")
            }
        }
    }
}

#Preview {
    RegistrationView()
}
