//
//  MovieAPIClient.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import Foundation

protocol MovieAPIClientProtocol {
    func fetchMovies() async throws -> [Movie]
}

struct MovieAPIClient: MovieAPIClientProtocol {
    private let baseURL = "https://freetestapi.com/api/v1"

    func fetchMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/movies?limit=20") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }
}
