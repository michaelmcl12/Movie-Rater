//
//  editMovie.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/11/24.
//

import SwiftUI
import SwiftData

struct editMovie: View {
    @Environment(\.modelContext) var modelContext
    
    var movie: Movie
    
    var body: some View {
        Text(movie.name)
    }
    
    
    func save () {
        movie.name = "save test"
        try? modelContext.save()
    }
}

//#Preview {
//    editMovie()
//}
