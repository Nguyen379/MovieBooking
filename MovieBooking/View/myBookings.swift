//
//  myBookings.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//

import SwiftUI

struct myBookings: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<3, id: \.self) { _ in
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Movie: ____________")
                        Text("Date: ____________")
                        Text("Time: ____________")
                        Text("Seat: ____________")
                    }
                    .padding()
                }
            }
            .navigationBarTitle("My Bookings")
        }
    }
}


#Preview {
    myBookings()
}
