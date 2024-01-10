//
//  movieRow.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI

struct movieRow: View {
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
    
    var body: some View {
        HStack {
            Text(movie.name)
            
            Spacer()
            
            Text(formattedYear)
            }
        }
    }

#Preview {
    movieRow(movie: Movie())
}
