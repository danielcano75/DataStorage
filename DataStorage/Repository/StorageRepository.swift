//
//  StorageRepository.swift
//  DataStorage
//
//  Created by Daniel Cano on 7/18/26.
//

import SwiftData

final class StorageRepository: StorageRepositoryProtocol {
    private var container: ModelContainer
    private var context: ModelContext
    
    init(with configuration: StorageConfiguration) throws {
        do {
            self.container = try ModelContainer(
                for: configuration.schema,
                configurations: configuration.configurations()
            )
            self.context = ModelContext(container)
        } catch {
            throw error
        }
    }
    
    func insert<T>(_ entity: T) throws where T : PersistentModel {
        context.insert(entity)
        try context.save()
    }
    
    func update() throws {
        try context.save()
    }
    
    func delete<T>(_ entity: T) throws where T : PersistentModel {
        context.delete(entity)
        try context.save()
    }
    
    func fetch<T>(_ type: T.Type) throws -> [T] where T : PersistentModel {
        let descriptor = FetchDescriptor<T>()
        return try context.fetch(descriptor)
    }
}
