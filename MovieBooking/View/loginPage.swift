//
//  loginPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI

struct loginPage: View {
    @StateObject private var userDetailView = userDetail()
    @State private var isHovered: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login Form")
                    .font(.title)
                    .padding()
                
                TextField("Username", text: $userDetailView.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $userDetailView.password)
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
