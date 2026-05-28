//
//  Users.swift
//  ColetaCerta
//
//  Created by Mateus on 28/05/26.
//

internal import CoreData

class User {
    private let context = CoreDataStack.shared.context
    
    func saveUserName(name: String) {
        let user = fetchUser() ?? NSEntityDescription.insertNewObject(
            forEntityName: "User",
            into: context
        )
        user.setValue(name, forKey: "name")
        save()
    }
    
    func fetchUser() -> NSManagedObject? {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Users")
        return try? context.fetch(request).first
    }
    
    func save(){
        guard context.hasChanges else { return }
        try? context.save()
    }
}
