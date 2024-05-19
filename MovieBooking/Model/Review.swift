//
//  Review.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}

