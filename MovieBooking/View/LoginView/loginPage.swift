//
//  loginPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI
import CoreData

struct loginPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false
    @State private var errorMessage: String?
    
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
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.horizontal, 20)
                }
                
                LargeButtonTemplate(action: validate)
                    Text("Login")
                
                .disabled(email.isEmpty || password.isEmpty)
                .padding()
                
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: signUp().navigationBarBackButtonHidden(true)) {
                        Text("Sign up")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .background(NavigationLink(destination: homePage().navigationBarBackButtonHidden(true), isActive: $isLoginSuccessful) { EmptyView() })
        }
    }
    
    private func validate() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            isLoginSuccessful = false
            return
        }
        
        if userDetails.fetchUser(email: email, password: password) {
            errorMessage = nil
            userDetails.email = email
            userDetails.password = password
            
            isLoginSuccessful = true
        } else {
            errorMessage = "Invalid email or password."
            isLoginSuccessful = false
        }
    }
}

#Preview {
    loginPage()
}
