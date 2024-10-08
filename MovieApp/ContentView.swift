// ContentView.swift
// MovieApp
//
// Created by Omar Yossri on 07/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var movieListViewModel = MovieListViewModel(preview: false)

    var body: some View {
        TabView {
            MovieListView(viewModel: movieListViewModel)
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            WatchedMoviesView()
                .tabItem {
                    Label("Watched", systemImage: "checkmark.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
