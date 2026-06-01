//
//  ContentView.swift
//  Watchlist
//
//  Created by Dhruv Patel on 31/05/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]

    var body: some View {
        List {
            
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(movies[index])
//            }
//        }
//    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
