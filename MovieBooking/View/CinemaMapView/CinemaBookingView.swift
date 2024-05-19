//
//  CinemaBookingView.swift
//  MovieBooking
//
//  Created by Lav More on 12/5/2024.
//

import SwiftUI

//Booking options for selected cinema
struct CinemaBookingView: View {
    var cinema: Cinema

    var body: some View {
        VStack(spacing: 20) {
            Text("Would you like to book at (cinema.name)?")
            NavigationLink(destination: HomeView()) {
                Text("Yes, book now!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle(Text(cinema.name), displayMode: .inline) // Adds a title to the booking view
        .padding()
    }
}
