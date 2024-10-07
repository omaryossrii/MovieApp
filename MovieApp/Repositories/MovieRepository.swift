//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovies() async throws -> [Movie]
}

class MovieRepository: MovieRepositoryProtocol {
    private let apiClient: MovieAPIClientProtocol

    init(apiClient: MovieAPIClientProtocol = MovieAPIClient()) {
        self.apiClient = apiClient
    }

    func getMovies() async throws -> [Movie] {
        return try await apiClient.fetchMovies()
    }
}
