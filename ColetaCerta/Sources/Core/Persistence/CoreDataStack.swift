//
//  CoreDataStack.swift
//  ColetaCerta
//
//  Created by Mateus on 28/05/26.
//
//

internal import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ColetaCerta")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Erro ao carregar o Core Data: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
