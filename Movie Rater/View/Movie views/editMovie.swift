//
//  editMovie.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/11/24.
//

import SwiftUI
import SwiftData

struct editMovie: View {
    var movie: Movie
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newName: String
    @State private var newDirector: String
    @State private var newYear: String
    @State private var newRating: Int
    @State private var newComments: String
    @State private var newGenre: Movie.Genre
    
    
    init(movie: Movie) {
         self.movie = movie
        _newName = State(initialValue: movie.name)
        _newDirector = State(initialValue: movie.director)
        _newYear = State(initialValue: String(movie.year))
        _newRating = State(initialValue: movie.rating)
        _newComments = State(initialValue: movie.comments)
        _newGenre = State(initialValue: movie.genre)
     }

    
    var body: some View {
        Form {
//            TextField("Movie Name", text: $newName)
//                .padding()
            
            Section(header: Text("Movie Details")) {
                TextField("Name", text: $newName)
                
                TextField("Director", text: $newDirector)
                
                TextField("Year", text: $newYear)
                    .keyboardType(.numberPad)
                
                Stepper("Rating: \(newRating)", value: $newRating, in: 1...5)
            }
            
            Section(header: Text("Genre")) {
                Picker("Genre", selection: $newGenre) {
                    ForEach(Movie.Genre.allCases, id: \.self) { genre in
                        Text(genre.rawValue)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            Section(header: Text("Comments")) {
                TextEditor(text: $newComments)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    save()
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
        }
        .navigationTitle(movie.name)
    }
    
    func save () {
        movie.name = newName
        movie.director = newDirector
        movie.year = Int(newYear) ?? 0
        movie.genre = newGenre
        movie.comments = newComments
        
        try? modelContext.save()
    }
}

//#Preview {
//    editMovie()
//}
