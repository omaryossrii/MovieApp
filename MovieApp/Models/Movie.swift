//
//  Movie.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation
import SwiftUI

// Movie struct to hold the movie details
struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let year: Int
    let genre: [String]
    let rating: Double
    let director: String
    let actors: [String]
    let plot: String
    let poster: String
    let trailer: URL
    let runtime: Int
    let awards: String
    let country: String
    let language: String
    let boxOffice: String
    let production: String
    let website: URL

    // Initializer with default values
    init(id: Int = 0,
         title: String = "Untitled",
         year: Int = 2000,
         genre: [String] = ["Genre"],
         rating: Double = 0.0,
         director: String = "Unknown Director",
         actors: [String] = ["Unknown Actor"],
         plot: String = "No plot available",
         poster: String = "https://example.com/defaultposter.jpg",
         trailer: URL = URL(string: "https://example.com/defaulttrailer.mp4")!,
         runtime: Int = 120,
         awards: String = "No awards",
         country: String = "Unknown",
         language: String = "Unknown",
         boxOffice: String = "N/A",
         production: String = "Unknown Production",
         website: URL = URL(string: "https://example.com")!) {
        self.id = id
        self.title = title
        self.year = year
        self.genre = genre
        self.rating = rating
        self.director = director
        self.actors = actors
        self.plot = plot
        self.poster = poster
        self.trailer = trailer
        self.runtime = runtime
        self.awards = awards
        self.country = country
        self.language = language
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
    }
}
