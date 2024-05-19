//
//  Seat.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
