//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    // Fetch movies using async/await
    func fetchMovies() async {
        guard let url = URL(string: "https://freetestapi.com/api/v1/movies?limit=20") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            DispatchQueue.main.async {
                self.movies = movies
            }
        } catch {
            print("Error fetching or decoding JSON: \(error)")
        }
    }

    init(preview: Bool)  {
        if preview {
            self.movies = [Movie(), Movie(), Movie()]
        } else {
            Task {
                await fetchMovies()
            }
        }
    }
}
