//
//  StorageFactoryTests.swift
//  DataStorageTests
//
//  Created by Daniel Cano on 7/18/26.
//

import Testing
import SwiftData
@testable import DataStorage

@Suite("StorageFactory Tests")
struct StorageFactoryTests {

    @Test func createsRepositorySuccessfully() throws {
        let config = StorageConfiguration(
            schema: Schema([TestEntity.self]),
            isStoredInMemoryOnly: true
        )
        let repo = try StorageFactory.create(with: config)
        #expect(repo is StorageRepository)
    }
}
