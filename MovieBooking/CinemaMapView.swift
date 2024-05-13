//
//  CinemaMapView.swift
//  MovieBooking
//
//  Created by Lav More on 12/5/2024.
//

import SwiftUI
import MapKit

//Map with annotations for each cinema
struct CinemaMapView: View {
    @Binding var region: MKCoordinateRegion
    let cinemas: [Cinema]

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                annotationItems: cinemas) { cinema in
                MapAnnotation(coordinate: cinema.coordinate) {
                    NavigationLink(destination: CinemaBookingView(cinema: cinema)) {
                        VStack {
                            Text(cinema.name)
                                .font(.caption)
                                .foregroundColor(.red) // Cinema name in red for visibility
                                .padding(5)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 3)

                            Circle() // Visual representation dot for cinema location
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            // Zoom Controls
            VStack {
                Button(action: zoomIn) {
                    Image(systemName: "plus.magnifyingglass")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .opacity(0.75)
                }
                
                Button(action: zoomOut) {
                    Image(systemName: "minus.magnifyingglass")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .opacity(0.75)
                }
            }
            .padding(.trailing, 20)
        }
    }
    
    private func zoomIn() {
        let newLatDelta = region.span.latitudeDelta * 0.7
        let newLonDelta = region.span.longitudeDelta * 0.7
        region.span = MKCoordinateSpan(latitudeDelta: newLatDelta, longitudeDelta: newLonDelta)
    }

    private func zoomOut() {
        let newLatDelta = region.span.latitudeDelta / 0.7
        let newLonDelta = region.span.longitudeDelta / 0.7
        region.span = MKCoordinateSpan(latitudeDelta: newLatDelta, longitudeDelta: newLonDelta)
    }
}
