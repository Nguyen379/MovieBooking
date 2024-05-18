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
            VStack{
                List {
                    NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)) {
                        Text("Sign Out")
                    }
                    
                    NavigationLink(destination: editDetails1(userDetails: <#userDetail#>).navigationBarBackButtonHidden(true)) {
                        Text("Edit User Details")
                    }
                    
                    NavigationLink(destination: myBookings().navigationBarBackButtonHidden(true)) {
                        Text("My Bookings")
                    }
                    NavigationLink(destination:homePage().navigationBarBackButtonHidden(true)) {
                        Text("Return to home page")
                    }
                }
                .navigationTitle("User Profile")
                
                

                }
            }
            
        }
    }



//#Preview {
//    userProfile()
//}
