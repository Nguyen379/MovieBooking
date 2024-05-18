//
//  editDetails2.swift
//  MovieBooking
//
//  Created by Minh Trinh on 14/5/2024.
//

import SwiftUI


struct editDetails2: View {
    @ObservedObject var userDetails: userDetail
    @State private var newUsername: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @Environment(\.presentationMode) private var presentationMode


    var body: some View {
        VStack {
            Text("Edit Details")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            TextField("New Email", text: $newEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            TextField("New Username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            Button("Save Changes") {
                updateDetails()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            self.newEmail = userDetails.email
            self.newUsername = userDetails.username
            self.newPassword = userDetails.password
        }
    }
    
    private func updateDetails() {
        let success = userDetails.modifyUser(email: userDetails.email, newUsername: newUsername, newEmail: newEmail, newPassword: newPassword)
        
        if success {
            // Update the observable object
            userDetails.username = newUsername
            userDetails.email = newEmail
            userDetails.password = newPassword
            
            // Dismiss the view
            presentationMode.wrappedValue.dismiss()
        } else {
            print("Failed to update user details")
        }
    }
}

//#Preview {
 //   editDetails2()
//}

