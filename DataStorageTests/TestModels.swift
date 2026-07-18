//
//  TestModels.swift
//  DataStorageTests
//
//  Created by Daniel Cano on 7/18/26.
//

import SwiftData

@Model
final class TestEntity {
    var name: String

    init(name: String) {
        self.name = name
    }
}
