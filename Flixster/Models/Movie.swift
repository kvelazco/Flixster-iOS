//
//  Movie.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/5/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let overview: String
    let poster_path: URL
    
    // Detail properties
    let vote_average: Double
    let vote_count: Int
    let backdrop_path: URL
    let popularity: Double
}

