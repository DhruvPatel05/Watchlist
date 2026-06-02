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
    @State private var isSheetPresented:Bool = false

    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack{
                    Text(movie.title)
                    Spacer()
                    Text(movie.genre.name)
                }//: LIST ROW
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(movie)
                        }
                    } label: {
                        Label("Delete",systemImage: "trash")
                    }
                }
            }
        }//: LIST
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        // MARK: - SAFE AREA
        .safeAreaInset(edge:.bottom,alignment:.center) {
            //NEW MOVIE BUTTON
            Button {
                isSheetPresented.toggle()
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }//: SAFE AREA
        //MARK: - SHEET
        .sheet(isPresented: $isSheetPresented) {
          NewMovieFormView()
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

#Preview("Sample Data") {
    ContentView()
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
