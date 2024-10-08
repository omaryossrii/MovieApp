import Foundation

class WatchedMoviesViewModel: ObservableObject {
    @Published var watchedMovies: [Int: Bool] = [:] // Store watched state with movie ID as key

    private let watchedMoviesKey = "watchedMovies" // Key for storing in UserDefaults

    init() {
        loadWatchedMovies()
    }

    // Mark or unmark a movie as watched
    func toggleWatched(movieID: Int) {
        watchedMovies[movieID] = !(watchedMovies[movieID] ?? false) // Toggle the watched state
        saveWatchedMovies()
    }

    // Check if a movie is watched
    func isWatched(movieID: Int) -> Bool {
        return watchedMovies[movieID] ?? false
    }

    private func saveWatchedMovies() {
        let watchedMoviesToStore = watchedMovies.map { (key, value) -> String in
            return "\(key):\(value)" // Convert to string format "ID:Watched"
        }
        UserDefaults.standard.set(watchedMoviesToStore, forKey: watchedMoviesKey)
    }

    private func loadWatchedMovies() {
        if let storedWatchedMovies = UserDefaults.standard.array(forKey: watchedMoviesKey) as? [String] {
            for item in storedWatchedMovies {
                let components = item.split(separator: ":")
                if components.count == 2,
                   let id = Int(components[0]),
                   let isWatched = Bool(String(components[1])) {
                    watchedMovies[id] = isWatched
                }
            }
        }
    }
}
