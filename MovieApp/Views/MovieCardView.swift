import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    @Binding var isWatched: Bool  // Binding to track watched state

    var body: some View {
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
            Spacer()
            // Eye icon to indicate watched state
            Button(action: {
                isWatched.toggle()
            }) {
                Image(systemName: isWatched ? "eye.fill" : "eye.slash.fill") // Use eye symbol
                    .foregroundColor(isWatched ? .green : .gray)
                    .font(.system(size: 30)) // Increase size of the icon
            }
            .buttonStyle(PlainButtonStyle())  // Disable default button styling
        }
        .padding() // Optional: Add padding to the card
    }
}

// Helper to create a preview with a stateful binding
struct StatefulPreviewWrapper<T: View>: View {
    @State private var value: Bool
    private var content: (Binding<Bool>) -> T
    
    init(_ initialValue: Bool, @ViewBuilder content: @escaping (Binding<Bool>) -> T) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

#Preview {
    StatefulPreviewWrapper(false) { isWatched in
        MovieCardView(movie: Movie.placeholder(), isWatched: isWatched)
    }
}
