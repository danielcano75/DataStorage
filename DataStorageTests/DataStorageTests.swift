//
//  DataStorageTests.swift
//  DataStorageTests
//
//  Created by Daniel Cano on 7/18/26.
//

import Testing
import SwiftData
@testable import DataStorage

@Suite("StorageRepository Tests")
struct StorageRepositoryTests {

    private func makeRepository() throws -> StorageRepositoryProtocol {
        let config = StorageConfiguration(
            schema: Schema([TestEntity.self]),
            isStoredInMemoryOnly: true
        )
        return try StorageFactory.create(with: config)
    }

    @Test func fetchReturnsEmptyWhenStoreIsEmpty() throws {
        let repo = try makeRepository()
        let results: [TestEntity] = try repo.fetch(TestEntity.self)
        #expect(results.isEmpty)
    }

    @Test func insertsEntityAndFetchesIt() throws {
        let repo = try makeRepository()
        try repo.insert(TestEntity(name: "Test"))
        let results: [TestEntity] = try repo.fetch(TestEntity.self)
        #expect(results.count == 1)
        #expect(results.first?.name == "Test")
    }

    @Test func fetchReturnsAllInsertedEntities() throws {
        let repo = try makeRepository()
        try repo.insert(TestEntity(name: "First"))
        try repo.insert(TestEntity(name: "Second"))
        let results: [TestEntity] = try repo.fetch(TestEntity.self)
        #expect(results.count == 2)
    }

    @Test func deletesEntityFromStore() throws {
        let repo = try makeRepository()
        try repo.insert(TestEntity(name: "ToDelete"))
        let inserted: [TestEntity] = try repo.fetch(TestEntity.self)
        try repo.delete(inserted[0])
        let results: [TestEntity] = try repo.fetch(TestEntity.self)
        #expect(results.isEmpty)
    }

    @Test func updatePersistsChanges() throws {
        let repo = try makeRepository()
        try repo.insert(TestEntity(name: "Original"))
        let inserted: [TestEntity] = try repo.fetch(TestEntity.self)
        inserted[0].name = "Updated"
        try repo.update()
        let results: [TestEntity] = try repo.fetch(TestEntity.self)
        #expect(results.first?.name == "Updated")
    }
}
