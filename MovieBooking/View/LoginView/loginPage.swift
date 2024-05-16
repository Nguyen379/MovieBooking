//
//  loginPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI

struct loginPage: View {
    @StateObject private var userDetailView = userDetail()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var match: Bool = false
    @State private var check: Bool = false

    let userInput = userDetail()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login Form")
                    .font(.title)
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack{
                    Button(action: {
                        if email == userInput.email && password == userInput.password{
                            match = true
                        } else {
                            match = false
                        }}){
                            Text("Validate")
                        }
                    
                    NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                        Text("Login")
                            .foregroundColor(match ? .blue : .gray)
                    }
                    .disabled(!match)
                    .padding()
                    
                }
                
                
                
                HStack {
                    Text("Don't have an account? ")
                    NavigationLink(destination: signUp().navigationBarBackButtonHidden(true)) {
                        Text("Sign up")
                        .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    loginPage()
}
