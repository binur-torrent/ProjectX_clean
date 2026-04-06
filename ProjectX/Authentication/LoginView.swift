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
                Spacer()
                VStack{
                    Text("Sign In to App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    DataInputRow(name: $mail, text: "Your name")
                    DataInputRow(name: $password, text: "Second name")
                }
                Spacer()
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Dont have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
