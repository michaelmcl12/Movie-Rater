//
//  addMovie.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI
import SwiftData

struct addMovie: View {
    @Environment(\.modelContext) var modelContext
    @State private var aName = ""
    @State private var aDirector = ""
    @State private var aYear = ""
    @State private var aRating = 1
    @State private var aComments = ""
    @State private var aGenre = Movie.Genre.action
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Movie Details")) {
                    TextField("Name", text: $aName)
                    
                    TextField("Director", text: $aDirector)
                    
                    TextField("Year", text: $aYear)
                        .keyboardType(.numberPad)
                    
                    Stepper("Rating: \(aRating)", value: $aRating, in: 1...5)
                }
                
                Section(header: Text("Genre")) {
                    Picker("Genre", selection: $aGenre) {
                        ForEach(Movie.Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Comments")) {
                    TextEditor(text: $aComments)
                }
                
                Section {
                    Button("Add Movie") {
                        addItem()
                    }
                }
            }
            .navigationTitle("Add a movie")
        }
    }
    
    func addItem () {
        let userMovie = Movie(
            year: Int(aYear) ?? 0,
            name: aName,
            director: aDirector,
            rating: aRating,
            comments: aComments,
            genre: aGenre)
        
        modelContext.insert(userMovie)
    }
}

#Preview {
    addMovie()
}
