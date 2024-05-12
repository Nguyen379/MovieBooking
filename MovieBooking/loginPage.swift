//
//  loginPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI

struct loginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isHovered: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login Form")
                    .font(.title)
                    .padding()
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: homePage()) {
                    Text("Login")
                }
                .padding()
                .scaleEffect(isHovered ? 1.2 : 1)
                .onHover { hovering in
                    withAnimation {
                        isHovered = hovering
                    }
                }
                
                HStack {
                    Text("Don't have an account? ")
                    NavigationLink(destination: signUp()) {
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
