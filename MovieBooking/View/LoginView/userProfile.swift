//
//  userProfile.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//

import SwiftUI


struct userProfile: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)


    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: loginPage().navigationBarBackButtonHidden(true)) {
                        Text("Sign Out")
                    }
                    
                    
                    NavigationLink(destination: homePage().navigationBarBackButtonHidden(true)) {
                        Text("Return to Home Page")
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
