//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    func fetchMovies() {
        guard let url = URL(string: "https://freetestapi.com/api/v1/movies?limit=20") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    DispatchQueue.main.async {
                        self.movies = movies
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }

    // New initializer for preview
    init(preview: Bool) {
        if preview {
            // Simulating fetching of movies; you can customize the mock movies if needed
            self.movies = [
                Movie(id: 1, title: "Inception", year: 2010, genre: ["Sci-Fi", "Action"], poster: "https://example.com/inception.jpg"),
                Movie(id: 2, title: "The Shawshank Redemption", year: 1994, genre: ["Drama"], poster: "https://example.com/shawshank.jpg"),
                Movie(id: 3, title: "The Dark Knight", year: 2008, genre: ["Action", "Thriller"], poster: "https://example.com/darkknight.jpg")
            ]
        } else {
            fetchMovies() // Call the fetch function for normal use
        }
    }
}
