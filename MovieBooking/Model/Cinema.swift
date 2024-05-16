//
//  Cinema.swift
//  MovieBooking
//
//  Created by Lav More on 12/5/2024.
//

import MapKit

struct Cinema: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
