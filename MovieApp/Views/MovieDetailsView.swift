//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.frame(height: 300)
                        .cornerRadius(10)
                }
                
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text("\(movie.year) • \(movie.genre.joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Rating: \(movie.rating, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Director: \(movie.director)")
                    .font(.headline)
                    .padding(.top, 5)

                Text("Actors: \(movie.actors.joined(separator: ", "))")
                    .font(.headline)
                    .padding(.top, 5)

                Text("Plot")
                    .font(.headline)
                    .padding(.top, 10)
                
                Text(movie.plot)
                    .font(.body)
                    .padding(.top, 5)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailsView(movie: Movie())
}
