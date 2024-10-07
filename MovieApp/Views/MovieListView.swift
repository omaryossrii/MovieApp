//
//  MovieListView.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//
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
                MovieCardView(movie: movie)
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
        return viewModel
    }())
}
