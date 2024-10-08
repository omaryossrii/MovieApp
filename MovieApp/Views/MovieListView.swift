import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @ObservedObject var watchedMoviesViewModel = WatchedMoviesViewModel() // Create an instance of WatchedMoviesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                MovieCardView(
                    movie: movie,
                    isWatched: Binding(
                        get: {
                            watchedMoviesViewModel.isWatched(movieID: movie.id) // Check if watched
                        },
                        set: { newValue in
                            watchedMoviesViewModel.toggleWatched(movieID: movie.id) // Update watched state
                        }
                    )
                )
            }
            .navigationTitle("Movies")
            .onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
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
