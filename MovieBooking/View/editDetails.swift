//
//  editDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//
import SwiftUI

struct editDetails: View {
    @StateObject private var UserDetail = userDetail()
    
    var body: some View {
        NavigationView {
            VStack {
                // Board to display username and password
                VStack(alignment: .leading, spacing: 10) {
                    Text("Your current username, email, password:")
                        .font(.titleFont)
                        .padding()
                    Text("Username:")
                    Text(UserDetail.username)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Text("Email:")
                    Text(UserDetail.email)
                        .frame(maxWidth: 300, alignment: .leading)                       .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Text("Password:")
                    Text(UserDetail.password)
                        .frame(maxWidth: 300, alignment: .leading)                       .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                        .padding()
                    
                    Text("To manage details, click the below buttons")
                    
                }
                .padding()
                
                // Buttons for Edit and Delete
                HStack {
                    NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                        Text("Edit")
                            .padding()
                            .buttonStyle(.bordered)
                    }
                    
                    NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                        Text("Delete account")
                            .padding()
                            .buttonStyle(.bordered)
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Edit User Details", displayMode: .inline)
        }
    }
    
}


#Preview {
    editDetails()
}
