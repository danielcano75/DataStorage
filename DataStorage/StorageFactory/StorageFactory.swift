//
//  StorageFactory.swift
//  DataStorage
//
//  Created by Daniel Cano on 7/18/26.
//

import Foundation

public enum StorageFactory {
    public static func create(whit configuration: StorageConfiguration) throws -> StorageRepositoryProtocol {
        try StorageRepository(with: configuration)
    }
}
