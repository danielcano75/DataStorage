# DataStorage

A lightweight iOS persistence framework that wraps SwiftData behind a protocol-oriented interface, keeping your business logic decoupled from the underlying storage implementation.

## Overview

DataStorage provides a thin abstraction layer over SwiftData. Instead of scattering `ModelContext` and `ModelContainer` calls throughout your codebase, you program against `StorageRepositoryProtocol` and swap implementations freely — including in-memory stores for testing.

## Requirements

- iOS 17+
- Swift 5.9+
- Xcode 15+

## Installation

### Swift Package Manager

Add DataStorage to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-org/DataStorage", from: "1.0.0")
]
```

## Usage

### 1. Define your model

```swift
import SwiftData

@Model
final class Task {
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
```

### 2. Create a repository via the factory

```swift
import DataStorage

let config = StorageConfiguration(schema: Schema([Task.self]))
let repository = try StorageFactory.create(with: config)
```

### 3. Use the repository

```swift
// Insert
let task = Task(title: "Buy milk")
try repository.insert(task)

// Fetch
let tasks: [Task] = try repository.fetch(Task.self)

// Update
tasks.first?.isCompleted = true
try repository.update()

// Delete
try repository.delete(tasks.first!)
```

### In-memory store for testing

```swift
let config = StorageConfiguration(
    schema: Schema([Task.self]),
    isStoredInMemoryOnly: true
)
let repository = try StorageFactory.create(with: config)
```

## API Reference

### `StorageRepositoryProtocol`

| Method | Description |
|--------|-------------|
| `insert<T: PersistentModel>(_ entity: T)` | Inserts and persists a new entity |
| `update()` | Persists any pending changes |
| `delete<T: PersistentModel>(_ entity: T)` | Deletes and persists the removal |
| `fetch<T: PersistentModel>(_ type: T.Type) -> [T]` | Returns all entities of the given type |

### `StorageConfiguration`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `schema` | `Schema` | — | SwiftData schema containing your models |
| `isStoredInMemoryOnly` | `Bool` | `false` | Use an in-memory store (useful for tests) |

## Architecture

```
StorageFactory          ← entry point
    └── StorageRepository (SwiftData)
            implements StorageRepositoryProtocol   ← your code depends on this
```

The protocol boundary means you can introduce alternative backends (CloudKit, Core Data, a mock) without touching call sites.

## License

MIT
