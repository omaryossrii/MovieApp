import SwiftUI

struct WatchedMoviesView: View {
    @ObservedObject var watchedMoviesViewModel = WatchedMoviesViewModel()
    @ObservedObject var movieListViewModel = MovieListViewModel(preview: true)

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
                    // Loop through the watched movies objects and display MovieCardView
                    ForEach(watchedMoviesViewModel.watchedmoviesObjecs) { movie in
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
            .onAppear {
                watchedMoviesViewModel.loadWatchedMovies()
                watchedMoviesViewModel.fetchWatchedMoviesDetails() // Fetch movie details when the view appears
            }
        }
    }
}

#Preview {
    WatchedMoviesView()
}
