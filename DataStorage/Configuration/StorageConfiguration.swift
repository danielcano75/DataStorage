//
//  StorageConfiguration.swift
//  DataStorage
//
//  Created by Daniel Cano on 7/18/26.
//

import SwiftData

public struct StorageConfiguration {
    let schema: Schema
    let isStoredInMemoryOnly: Bool
    
    public init(
        schema: Schema,
        isStoredInMemoryOnly: Bool = false
    ) {
        self.schema = schema
        self.isStoredInMemoryOnly = isStoredInMemoryOnly
    }
    
    func configurations() -> [ModelConfiguration] {
        [
            ModelConfiguration(
                schema: schema,
                isStoredInMemoryOnly: isStoredInMemoryOnly
            )
        ]
    }
}
