//
//  TicketDate.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI

import Foundation
struct TicketDate: Equatable
{
    var day: String
    var month: String
    var year: String
    static var `default`: TicketDate
    {
        TicketDate(day: "", month: "", year: "")
    }
}

