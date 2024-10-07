//
//  MovieListView.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                HStack {
                    AsyncImage(url: URL(string: movie.poster)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                    } placeholder: {
                        Color.gray.frame(width: 100, height: 150)
                    }
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.year.description)
                        Text(movie.genre.joined(separator: ", "))
                    }
                }
            }
            .navigationTitle("Movies")
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }
}

#Preview {
    MovieListView(viewModel: {
        let viewModel = MovieListViewModel(preview: true)
        viewModel.movies = [
            Movie(id: 1, title: "Mock Movie 1", year: 2023, genre: ["Action"], rating: 8.5, director: "Director A", actors: ["Actor A"], plot: "Plot of Mock Movie 1", poster: "https://example.com/poster1.jpg", trailer: URL(string: "https://example.com/trailer1.mp4")!, runtime: 120, awards: "None", country: "USA", language: "English", boxOffice: "$100M", production: "Production A", website: URL(string: "https://example.com")!),
            Movie(id: 2, title: "Mock Movie 2", year: 2022, genre: ["Drama"], rating: 7.2, director: "Director B", actors: ["Actor B"], plot: "Plot of Mock Movie 2", poster: "https://example.com/poster2.jpg", trailer: URL(string: "https://example.com/trailer2.mp4")!, runtime: 150, awards: "None", country: "UK", language: "English", boxOffice: "$80M", production: "Production B", website: URL(string: "https://example.com")!),
            Movie(id: 3, title: "Mock Movie 3", year: 2021, genre: ["Comedy"], rating: 6.5, director: "Director C", actors: ["Actor C"], plot: "Plot of Mock Movie 3", poster: "https://example.com/poster3.jpg", trailer: URL(string: "https://example.com/trailer3.mp4")!, runtime: 90, awards: "None", country: "Canada", language: "English", boxOffice: "$50M", production: "Production C", website: URL(string: "https://example.com")!)
        ]
        return viewModel
    }())
}
