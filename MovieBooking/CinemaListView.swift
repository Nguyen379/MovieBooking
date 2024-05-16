//
//  CinemaListView.swift
//  MovieBooking
//
//  Created by Lav More on 12/5/2024.
//

import SwiftUI
import MapKit

//List of cinemas you can select that adjusts map view
struct CinemaListView: View {
    let cinemas: [Cinema]
    @Binding var selectedRegion: MKCoordinateRegion //Bound to content view
    @Binding var showingCinemaList: Bool  // Controlled by content view
    
    var body: some View {
        VStack {
            List(cinemas) { cinema in
                Button(cinema.name) {
                    selectedRegion.center = cinema.coordinate
                    selectedRegion.span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    showingCinemaList = false  // Close the list when a cinema is selected
                }
                .padding(.top, 20)
            }
        }
    }
}
