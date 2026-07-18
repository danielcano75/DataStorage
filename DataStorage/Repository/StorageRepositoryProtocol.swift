//
//  StorageRepositoryProtocol.swift
//  DataStorage
//
//  Created by Daniel Cano on 7/18/26.
//

import SwiftData

public protocol StorageRepositoryProtocol {
    func insert<T: PersistentModel>(_ entity: T) throws
    
    func update() throws
    
    func delete<T: PersistentModel>(_ entity: T) throws
    
    func fetch<T: PersistentModel>(
        _ type: T.Type
    ) throws -> [T]
}
