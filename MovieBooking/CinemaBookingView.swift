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
            Text("Would you like to book at \(cinema.name)?")
            NavigationLink("Yes, book now!", destination: Text("Booking Screen (To be implemented by another team member)"))
            .padding()
        }
        .navigationBarTitle(Text(cinema.name), displayMode: .inline) // Adds a title to the booking view
        .padding()
    }
}
