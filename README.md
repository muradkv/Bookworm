# Bookworm

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Persistence](https://img.shields.io/badge/Persistence-SwiftData-34C759)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

A personal book review tracking application designed to help users log, rate, and record memories of their favorite reads, built natively with SwiftUI and SwiftData.

Bookworm enables users to keep a persistent personal library, evaluate books using custom star rating components, write detailed reviews, and organize titles by genres. The app features reactive persistence pipelines, type-safe data modeling, empty-state UI handling, and a modular architectural layer.

## Preview

<img width="23%" alt="Empty List" src="https://github.com/user-attachments/assets/ecbf43de-a253-4bcb-a9ce-53fe33b5689c" />
<img width="23%" alt="Main List" src="https://github.com/user-attachments/assets/d7c0e51e-fa90-4598-8cec-978cc10dc836" />
<img width="23%" alt="Detail Book" src="https://github.com/user-attachments/assets/988e7729-73e7-4f2a-b5b6-b575528e7e68" />
<img width="23%" alt="Add Book" src="https://github.com/user-attachments/assets/6c4538a3-33af-41d7-b1b3-4c693d8d48e1" />

## Features

* **Persistent Local Storage:** Native SwiftData model container integrating lightweight persistence with zero setup boilerplate.
* **Custom Rating Subsystem:** Reusable interactable rating control used for inputting user evaluations and read-only displays.
* **Type-Safe Domain Genres:** Enforced data safety across book genres leveraging enum structures mapped to asset rendering.
* **Empty State Handling:** Graceful fallback layouts driven by iOS 18+ `ContentUnavailableView` when no records are available.
* **Form Validation:** Input sanitization ensuring blank or whitespace-only book titles and authors cannot be saved.

## About the Project & Challenge

This application was originally built to fulfill **Project 11 (Days 53-56)** of the SwiftUI learning path by Paul Hudson (Hacking with Swift). The core educational goal was to master `@Model`, `@Query`, `@Environment(\.modelContext)`, and local persistence using Apple's SwiftData framework.

Beyond the baseline curriculum, the entire codebase underwent a comprehensive refactoring into a production-ready **MVVM** architecture, completely decoupling business logic and mutations from the rendering layer. Key concepts and best practices implemented include:

* **SwiftData & MVVM Decoupling:** Solved the framework coupling issue of `@Query` inside ViewModels by leveraging dependency injection, passing reactive collections into isolated ViewModels strictly for mutations.
* **Explicit Dependency Injection:** Custom `init` state wrapping using `State(wrappedValue:)` to safely pass model instances into screen-level ViewModels upon dynamic navigation transitions.
* **View Composition:** Extracted dense list layouts into atomic `BookRowView` units with computed styling properties to enforce the Single Responsibility Principle.

🔗 **[Full project description here](https://www.hackingwithswift.com/100/swiftui/53)**

## Project Versioning & Changelog

* **v1.2.0 (MVVM & Type Safety Refactoring)** — `commit: f189343`
  Migrated all screens to isolated `@Observable` ViewModels. Replaced raw strings with a type-safe `Genre` enum, introduced `ContentUnavailableView` empty states, and restructured code into domain folders.

* **v1.1.0 (Data Enhancements & Validation)** — `commit: a05ab84`
  Added creation timestamp rendering in `DetailView`, custom rating-based color formatting in list rows, form input validation, and manual `ModelContext` saving fixes for persistent storage stability.

* **v1.0.0 (Functional MVP)** — `commit: 94b43d7`
  Initial core release matching the course curriculum. Implemented SwiftData persistence with `@Model class Book`, custom interactive `RatingView`, list sorting, deletion, and basic detail navigation.
