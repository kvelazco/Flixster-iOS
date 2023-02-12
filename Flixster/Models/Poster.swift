//
//  Poster.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/11/23.
//

import Foundation

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: URL
    let backdrop_path: URL
    
    let title: String
    let overview: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}
