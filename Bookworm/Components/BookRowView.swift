//
//  BookRowView.swift
//  Bookworm
//
//  Created by murad on 04.07.2026.
//

import SwiftUI
import SwiftData

struct BookRowView: View {
    let book: Book
    
    var titleColor: Color {
        book.rating == 1 ? Color.red : .primary
    }
    
    var body: some View {
        HStack {
            EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                    .foregroundStyle(titleColor)
                Text(book.author)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Book.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let mockBook = Book(title: "Test Book", author: "Test Author", genre: Genre.fantasy, review: "Great!", rating: 1)
    container.mainContext.insert(mockBook)
    
    return BookRowView(book: mockBook)
}
