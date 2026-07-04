//
//  DetailViewModel.swift
//  Bookworm
//
//  Created by murad on 04.07.2026.
//

import SwiftUI
import SwiftData

@Observable
final class DetailViewModel {
    let book: Book
    var showingDeleteAlert = false
    
    init(book: Book, showingDeleteAlert: Bool = false) {
        self.book = book
        self.showingDeleteAlert = showingDeleteAlert
    }
    
    func deleteBook(into context: ModelContext) {
        context.delete(book)
    }
}
