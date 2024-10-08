// Movie.swift
import Foundation

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

    // Static method to create a placeholder Movie (for previews, mock data, etc.)
    static func placeholder() -> Movie {
        return Movie(
            id: 0,
            title: "Placeholder Title",
            year: 2000,
            genre: ["Genre"],
            rating: 0.0,
            director: "Unknown Director",
            actors: ["Unknown Actor"],
            plot: "No plot available",
            poster: "https://example.com/defaultposter.jpg",
            trailer: URL(string: "https://example.com/defaulttrailer.mp4")!,
            runtime: 120,
            awards: "No awards",
            country: "Unknown",
            language: "Unknown",
            boxOffice: "N/A",
            production: "Unknown Production",
            website: URL(string: "https://example.com")!
        )
    }
}
