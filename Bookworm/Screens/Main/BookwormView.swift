//
//  BookwormView.swift
//  Bookworm
//
//  Created by murad on 30.06.2026.
//

import SwiftUI
import SwiftData

struct BookwormView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var viewModel = BookwormViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        BookRowView(book: book)
                    }
                }
                .onDelete { offsets in
                    viewModel.deleteBooks(at: offsets, from: books, into: modelContext)
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        viewModel.showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $viewModel.showingAddScreen) {
                AddBookView()
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
        }
    }
}

#Preview {
    BookwormView()
        .modelContainer(for: Book.self, inMemory: true)
}
