//
//  StorageConfigurationTests.swift
//  DataStorageTests
//
//  Created by Daniel Cano on 7/18/26.
//

import Testing
import SwiftData
@testable import DataStorage

@Suite("StorageConfiguration Tests")
struct StorageConfigurationTests {

    @Test func defaultIsStoredInMemoryOnlyIsFalse() {
        let schema = Schema([TestEntity.self])
        let config = StorageConfiguration(schema: schema)
        #expect(config.isStoredInMemoryOnly == false)
    }

    @Test func returnsOneModelConfiguration() {
        let schema = Schema([TestEntity.self])
        let config = StorageConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let configurations = config.configurations()
        #expect(configurations.count == 1)
    }

    @Test func configurationRespectsIsStoredInMemoryOnly() {
        let schema = Schema([TestEntity.self])
        let config = StorageConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let configurations = config.configurations()
        #expect(configurations.first?.isStoredInMemoryOnly == true)
    }
}
