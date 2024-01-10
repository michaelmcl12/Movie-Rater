//
//  movie.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Movie: Identifiable {
    var id: String
    var year: Int
    var name: String
    var director: String
    var rating: Int
    var comments: String
    
    var genre: Genre
    enum Genre: String, CaseIterable, Codable {
        case action = "Action"
        case adventure = "Adventure"
        case animated = "Animated"
        case comedy = "Comedy"
        case drama = "Drama"
        case fantasy = "Fantasy"
        case historical = "Historical"
        case horror = "Horror"
        case musical = "Musical"
        case romance = "Romance"
        case sciFi = "Science Ficton"
        case thriller = "thriller"
        case western = "Western"
    }

    init(year: Int, name: String, director: String, rating: Int, comments: String, genre: Genre) {
        id = UUID().uuidString
        self.year = year
        self.name = name
        self.director = director
        self.rating = rating
        self.comments = comments
        self.genre = genre
    }
    
    init() {
        id = UUID().uuidString
        year = 1977
        name = "Star Wars"
        director = "George Lucas"
        rating = 5
        comments = "The greatest movie of all time"
        genre = .sciFi
    }
}
