import SwiftUI

struct WatchedMoviesView: View {
    @ObservedObject var watchedMoviesViewModel = WatchedMoviesViewModel() // Create an instance of WatchedMoviesViewModel
    @ObservedObject var movieListViewModel = MovieListViewModel(preview: true) // Replace with your actual view model that fetches movies

    var body: some View {
        NavigationView {
            List {
                let watchedMovieIDs = watchedMoviesViewModel.watchedMovies.filter { $0.value }.map { $0.key }

                if watchedMovieIDs.isEmpty {
                    Text("No Watched Movies Yet")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(movieListViewModel.movies.filter { watchedMovieIDs.contains($0.id) }) { movie in
                        MovieCardView(
                            movie: movie,
                            isWatched: Binding(
                                get: {
                                    watchedMoviesViewModel.isWatched(movieID: movie.id)
                                },
                                set: { newValue in
                                    watchedMoviesViewModel.toggleWatched(movieID: movie.id)
                                }
                            )
                        )
                    }
                }
            }
            .navigationTitle("Watched Movies")
        }
    }
}

#Preview {
    WatchedMoviesView()
}
