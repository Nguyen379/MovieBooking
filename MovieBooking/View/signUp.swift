//
//  signUp.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI


struct signUp: View {
    @StateObject private var newUserDetail = userDetail()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Sign Up Form")
                    .font(.title)
                    .padding()
                
                TextField("Email", text: $newUserDetail.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Full Name", text: $newUserDetail.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
                SecureField("Password", text: $newUserDetail.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                    Text("Sign Up")
                    .foregroundColor(.blue)                }
                .padding()
                
                HStack{
                    Text("Already have an account?")
                    NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)){
                        Text("Login")
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
    signUp()
}
