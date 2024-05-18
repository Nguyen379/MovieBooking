//
//  editDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//
import SwiftUI

struct editDetails1: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        NavigationView {
            VStack {
                // Board to display username and password
                VStack(alignment: .leading, spacing: 10) {
                    Text("Your current username, email, password:")
                        .font(.titleFont)
                        .padding()
                    Text("Username:")
                    Text(userDetails.username)
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Text("Email:")
                    Text(userDetails.email)
                        .frame(maxWidth: 300, alignment: .leading)                       .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    Text("Password:")
                    Text(userDetails.password)
                        .frame(maxWidth: 300, alignment: .leading)                       .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                        .padding()
                    
                    Text("To manage details, click the below buttons")
                    
                }
                .padding()
                
                // Buttons for Edit and Delete
                HStack {
                    NavigationLink(destination: editDetails2().navigationBarBackButtonHidden(true)) {
                        Text("Edit")
                            .padding()
                            .buttonStyle(.bordered)
                    }
                    
                    NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)) {
                        Text("Delete account")
                            .padding()
                            .buttonStyle(.bordered)
                            .foregroundColor(.red)
                    }
                }
                    NavigationLink(destination: userProfile().navigationBarBackButtonHidden(true)) {
                        Text("Go back")
                            .padding()
                            .buttonStyle(.bordered)
                            .foregroundColor(.blue)
                    }
            }
            .navigationBarTitle("Edit User Details", displayMode: .inline)
        }
    }
    
}


#Preview {
    editDetails1()
}
