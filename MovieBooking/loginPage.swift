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
        VStack {
            Spacer()


            Text("Login Form")
                .font(.title)
                .padding()
            Spacer()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()


            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()


            Button(action: {
                // Add login functionality here
            }) {
                Text("Login")
            }
            .padding()
            .scaleEffect(isHovered ? 1.2 : 1) // Hover effect
            .onHover { hovering in
                withAnimation {
                    isHovered = hovering
                }
            }


            Spacer()
        }
        .padding()
    }
}



#Preview {
    loginPage()
}
