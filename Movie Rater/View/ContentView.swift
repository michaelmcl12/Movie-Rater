//
//  ContentView.swift
//  Movie Rater
//
//  Created by Michael McLaughlin on 1/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case add
    }
    
    var body: some View {
        TabView(selection: $selection) {
            movieList()
                .tabItem {
                    Label("list", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            addMovie()
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }
                .tag(Tab.add)
        }
    }
}

#Preview {
    ContentView()
}
