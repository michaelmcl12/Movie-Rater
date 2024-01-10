//
//  Movie_RaterApp.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI
import SwiftData

@main
struct Movie_RaterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
