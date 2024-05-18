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
            userDetails.displayUser()
            
            NavigationLink(destination: editDetails2(userDetails: userDetails).navigationBarBackButtonHidden(true)) {
                Text("Edit Details")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
            
            NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                Text("Home Page")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("User Detail")
    }
}














//#Preview {
 //   editDetails1()
//}
