//
//  AddBookView.swift
//  Bookworm
//
//  Created by murad on 01.07.2026.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel = AddBookViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $viewModel.title)
                    TextField("Author's name", text: $viewModel.author)
                    
                    Picker("Genre", selection: $viewModel.genre) {
                        ForEach(Genre.allCases, id: \.self) {
                            Text($0.displayName)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $viewModel.review)
                    RatingView(rating: $viewModel.rating)
                }
                
                Section {
                    Button("Save") {
                        viewModel.saveBook(into: modelContext)
                        print(viewModel.genre)
                        dismiss()
                    }
                    .disabled(viewModel.isValidForm == false)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
