//
//  movieList.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI
import SwiftData

struct movieList: View {
    @Environment(\.modelContext) var modelContext
    @Query var movies: [Movie]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink {
                        movieDetail(movie: movie)
                    } label: {
                        movieRow(movie: movie)
                    }
                }                
                .onDelete {indexes in
                    for index in indexes {
                        deleteMovie(movies[index])
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a Movie")
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        modelContext.delete(movie)
    }
}

#Preview {
    movieList()
}
