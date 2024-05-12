//
//  userProfile.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//

import SwiftUI

struct userProfile: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)) {
                    Text("Sign Out")
                }
                
                NavigationLink(destination: editDetails()) {
                    Text("Edit User Details")
                }
                
                NavigationLink(destination: myBookings()) {
                    Text("My Bookings")
                }
            }
            .navigationTitle("User Profile")
        }
    }
}


#Preview {
    userProfile()
}
