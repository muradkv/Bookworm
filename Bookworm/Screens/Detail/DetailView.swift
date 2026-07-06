//
//  DetailView.swift
//  Bookworm
//
//  Created by murad on 02.07.2026.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: DetailViewModel
    
    init(book: Book) {
        _viewModel = State(wrappedValue: DetailViewModel(book: book))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(viewModel.book.genre.displayName)
                    .resizable()
                    .scaledToFit()
                
                Text(viewModel.book.genre.displayName.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(viewModel.book.author)
                .font(.title)
                .foregroundStyle(.secondary)

            Text(viewModel.book.review)
                .padding()
            
            Text(viewModel.book.date.formatted(date: .long, time: .omitted))
                .padding()

            RatingView(rating: .constant(viewModel.book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(viewModel.book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $viewModel.showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                viewModel.deleteBook(into: modelContext)
                dismiss()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                viewModel.showingDeleteAlert = true
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: Genre.fantasy, review: "This was a great book; I really enjoyed it.", rating: 4)
        
        return NavigationStack {
            DetailView(book: example)
                .modelContainer(container)
        }
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
