//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let repository: MovieRepositoryProtocol

    init(repository: MovieRepositoryProtocol = MovieRepository(), preview: Bool = false) {
        self.repository = repository
        if preview {
            self.movies = [Movie(), Movie(), Movie()] // Sample data for previews
        } else {
            Task {
                await fetchMovies()
            }
        }
    }

    func fetchMovies() async {
        do {
            let movies = try await repository.getMovies()
            DispatchQueue.main.async {
                self.movies = movies
            }
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}
