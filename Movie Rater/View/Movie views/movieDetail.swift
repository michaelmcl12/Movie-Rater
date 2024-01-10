//
//  movieDetail.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI

struct movieDetail: View {
    var movie: Movie
    
    private var formattedYear: String {
        let calendar = Calendar.current
        let components = DateComponents(year: movie.year)
        
        if let date = calendar.date(from: components) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        } 
        else {
            return "Invalid Date"
        }
    }
    
    private var stars: String {
        var starString = ""
        
        for _ in 0..<movie.rating {
            starString += "⭐️"
        }
        
        return starString
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(movie.name)
                    .bold()
                    .font(.largeTitle)

                HStack {
                    Text("Director: ")
                    Text(movie.director)
                        
                }.font(.title)

                HStack {
                    Text(movie.genre.rawValue)
                    
                    Spacer()
                    
                    Text(formattedYear)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                VStack (alignment: .leading) {
                    HStack{
                        Text("Rating")
                            .font(.title2)
                        Text(stars)
                    }
                    
                    Spacer()
                    
                    Text("Comments:")
                        .font(.title2)
                    Text(movie.comments)
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    let aMovie = Movie()
//    return movieDetail(movie: aMovie)
//}
