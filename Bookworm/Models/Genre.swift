//
//  Genre.swift
//  Bookworm
//
//  Created by murad on 05.07.2026.
//

import Foundation

enum Genre: String, CaseIterable, Codable {
    case fantasy
    case horror
    case kids
    case mystery
    case poetry
    case romance
    case thriller
    
    var displayName: String {
        switch self {
        case .fantasy:
            "Fantasy"
        case .horror:
            "Horror"
        case .kids:
            "Kids"
        case .mystery:
            "Mystery"
        case .poetry:
            "Poetry"
        case .romance:
            "Romance"
        case .thriller:
            "Thriller"
        }
    }
}
