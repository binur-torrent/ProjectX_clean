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
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack{
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    DataInputRow(name: $mail, text: "Email Address")
                    DataInputRow(name: $name, text: "Your Name")
                    DataInputRow(name: $password, text: "Password")
                    DataInputRow(name: $confirmPassword, text: "Confirm Password")
                }
                
                Spacer()
                
                Button{
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
