//
//  MovieCardView.swift
//  MovieApp
//
//  Created by Omar Yossri on 07/10/2024.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie

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
        }
    }
}

#Preview {
    MovieDetailsView(movie: Movie.placeholder())
}
