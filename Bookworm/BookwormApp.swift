//
//  BookwormApp.swift
//  Bookworm
//
//  Created by murad on 30.06.2026.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            BookwormView()
        }
        .modelContainer(for: Book.self)
    }
}
