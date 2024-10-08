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

    // Custom initializer with no default values
    init(id: Int, title: String, year: Int, genre: [String], rating: Double,
         director: String, actors: [String], plot: String, poster: String,
         trailer: URL, runtime: Int, awards: String, country: String,
         language: String, boxOffice: String, production: String, website: URL) {
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

    // Static method to create a placeholder Movie (for previews, mock data, etc.)
    static func placeholder() -> Movie? {
        // Safely unwrap the optional URLs using guard let
        guard let trailerURL = URL(string: "https://example.com/defaulttrailer.mp4"),
              let websiteURL = URL(string: "https://example.com") else {
            // Return nil if the URLs are invalid
            print("Error: Invalid URL for placeholder movie.")
            return nil
        }

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
            trailer: trailerURL,
            runtime: 120,
            awards: "No awards",
            country: "Unknown",
            language: "Unknown",
            boxOffice: "N/A",
            production: "Unknown Production",
            website: websiteURL
        )
    }
}
