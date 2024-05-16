//
//  ContentView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/12/24.
//

import SwiftUI
import MapKit

struct MapContentView: View {
    //Static list of cinemas
    let cinemas = [
        Cinema(name: "Burwood Cinema", coordinate: CLLocationCoordinate2D(latitude: -33.8708, longitude: 151.1043)),
        Cinema(name: "Macquarie Park Cinema", coordinate: CLLocationCoordinate2D(latitude: -33.7777, longitude: 151.1206)),
        Cinema(name: "Town Hall Cinema", coordinate: CLLocationCoordinate2D(latitude: -33.8731, longitude: 151.2055)),
        Cinema(name: "Bondi Junction Cinema", coordinate: CLLocationCoordinate2D(latitude: -33.8949, longitude: 151.2653)),
        Cinema(name: "Parramatta Cinema", coordinate: CLLocationCoordinate2D(latitude: -33.8176, longitude: 151.0035))
    ]
    //Current region of map
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
        span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
    )
    //Cinema list visibility control
    @State private var showingCinemaList = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                //Map view of cinemas
                CinemaMapView(region: $region, cinemas: cinemas)
                    .onTapGesture {
                    if showingCinemaList {
                        withAnimation {
                        showingCinemaList = false
                            }
                        }
                    }
                
                //List visibility toggle
                Button(action: {
                    withAnimation {
                        showingCinemaList.toggle()
                    }
                }) {
                    Image(systemName: "list.bullet")
                        .padding()
                        .background(Color.white.opacity(0.75))
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .padding()
                }

                //Show or hide cinema list
                if showingCinemaList {
                    CinemaListView(cinemas: cinemas, selectedRegion: $region, showingCinemaList: $showingCinemaList)
                        .frame(width: 250)
                        .transition(.move(edge: .trailing))
                        .background(Color.white)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MapContentView()
}
