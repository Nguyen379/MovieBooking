//
//  editDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//

// ViewUserDetailPage.swift
import SwiftUI

struct editDetails1: View {
    @ObservedObject var userDetails: userDetail
    
    var body: some View {
        VStack {
            Label("Username: \(userDetails.username)", systemImage: "person.fill")
            Label("Email: \(userDetails.email)", systemImage: "envelope.fill")
            Label("Password: \(userDetails.password)", systemImage: "lock.fill")
            
            NavigationLink(destination: editDetails2(userDetails: userDetails).navigationBarBackButtonHidden(true)) {
                Text("Edit Details")
                    .padding()
            }
            
            NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                Text("Home")
                    .padding()
            }
        }
        .onAppear {
            userDetails.fetchUser(email: userDetails.email, password: userDetails.password)
        }
        .navigationTitle("User Detail")
    }
}







//#Preview {
  //  editDetails1()
//}
