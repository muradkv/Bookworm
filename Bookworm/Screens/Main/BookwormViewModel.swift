//
//  BookwormViewModel.swift
//  Bookworm
//
//  Created by murad on 05.07.2026.
//

import SwiftUI
import SwiftData

@Observable
final class BookwormViewModel {
    var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet, from books: [Book], into context: ModelContext) {
        for offset in offsets {
            let book = books[offset]
            context.delete(book)
        }
        try? context.save()
    }
}
