//
//  MovieURL.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/18/24.
//

import Foundation
enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    case topRated = "top_rated"
    
    public var urlString: String {
        "\(MovieService.movieBaseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}
