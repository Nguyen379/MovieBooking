//
//  signUp.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI
import CoreData

struct signUp: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)
    
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var isSignUpSuccessful: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Sign Up Form")
                .font(.title)
                .padding()
            
            TextField("Email", text: $userDetails.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Username", text: $userDetails.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        
            SecureField("Password", text: $userDetails.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.horizontal, 20)
            }
            
            Button(action: signup) {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }

            if isSignUpSuccessful {
                Text("Sign Up Successful!")
                    .foregroundColor(.green)
                    .padding(.top, 10)
            }
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)) {
                    Text("Login")
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func signup() {
        guard !userDetails.email.isEmpty,
              !userDetails.username.isEmpty,
              !userDetails.password.isEmpty,
              userDetails.password == confirmPassword else {
            errorMessage = "All fields are required and passwords must match."
            return
        }
        
        if userDetails.saveUserDetails() {
            errorMessage = nil
            isSignUpSuccessful = true
        } else {
            errorMessage = "Failed to sign up. Please try again."
            isSignUpSuccessful = false
        }
    }
}



#Preview {
    signUp()
}
