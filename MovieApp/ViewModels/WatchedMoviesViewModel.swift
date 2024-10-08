import Foundation
import Combine

class WatchedMoviesViewModel: ObservableObject {
    @Published var watchedMovies: [Int: Bool] = [:] // Store watched state with movie ID as key
    @Published var watchedmoviesObjecs: [Movie] = []
    
    private let watchedMoviesKey = "watchedMovies" // Key for storing in UserDefaults
    private var cancellables = Set<AnyCancellable>() // For Combine subscriptions

    init() {
        loadWatchedMovies()
        fetchWatchedMoviesDetails()
    }

    // Mark or unmark a movie as watched
    func toggleWatched(movieID: Int) {
        watchedMovies[movieID] = !(watchedMovies[movieID] ?? false)
        saveWatchedMovies()
        print("Watched movies toggled: \(watchedMovies)")
    }

    // Check if a movie is watched
    func isWatched(movieID: Int) -> Bool {
        return watchedMovies[movieID] ?? false
    }

    // NoWatchedMovies function returns true when it loops over the watched movies dictionary and they are all false
    func NoWatchedMovies() -> Bool {
        return watchedMovies.values.allSatisfy { !$0 }
    }

    private func saveWatchedMovies() {
        let watchedMoviesToStore = watchedMovies.map { (key, value) -> String in
            return "\(key):\(value)" // Convert to string format "ID:Watched"
        }
        UserDefaults.standard.set(watchedMoviesToStore, forKey: watchedMoviesKey)
    }

    func loadWatchedMovies() {
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

    // Fetch details of watched movies
    func fetchWatchedMoviesDetails() {
        let watchedMovieIDs = watchedMovies.filter { $0.value }.map { $0.key } // Filter IDs of watched movies
        
        // Loop through watchedMovieIDs and fetch each movie details
        for movieID in watchedMovieIDs {
            fetchMovieDetails(by: movieID)
        }
    }

    // Async function to fetch movie details
    private func fetchMovieDetails(by id: Int) {
        guard let url = URL(string: "https://freetestapi.com/api/v1/movies/\(id)") else { return }

        // Perform the network request
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Switch to the main thread for UI updates
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break // Handle completion if needed
                case .failure(let error):
                    print("Error fetching movie details: \(error)")
                }
            }, receiveValue: { [weak self] movie in
                // Check if the movie already exists before appending
                if !(self?.watchedmoviesObjecs.contains(where: { $0.id == movie.id }) ?? false) {
                    self?.watchedmoviesObjecs.append(movie) // Append fetched movie to the array
                }
            })
            .store(in: &cancellables) // Store the subscription
    }
}
