//
//  AddBookViewModel.swift
//  Bookworm
//
//  Created by murad on 04.07.2026.
//

import SwiftUI
import SwiftData

@Observable
final class AddBookViewModel {
    var title = ""
    var author = ""
    var rating = 3
    var genre = "Fantasy"
    var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isValidForm: Bool {
        let cleanedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedAuthor = author.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return cleanedTitle.isEmpty == false && cleanedAuthor.isEmpty == false
    }
    
    func saveBook(into context: ModelContext) {
        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
        context.insert(newBook)
        try? context.save()
    }
}

