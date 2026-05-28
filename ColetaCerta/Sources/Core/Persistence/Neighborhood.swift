//
//  Neighborhood.swift
//  ColetaCerta
//
//  Created by Mateus on 28/05/26.
//

internal import CoreData

class Neighborhood {
    private let context = CoreDataStack.shared.context
    
    func saveUserNeighborhood(name: String, neighborhoodName: String) {
        let userEntity = fetchUserNeighborhood() ?? NSEntityDescription.insertNewObject(
            forEntityName: "User",
            into: context
        )
        userEntity.setValue(name, forKey: "userName")
        userEntity.setValue(neighborhoodName, forKey: "userNeighborhood")
        
        save()
    }
    
    func fetchUserNeighborhood() -> NSManagedObject? {
        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        return try? context.fetch(request).first
    }
    
    func save(){
        guard context.hasChanges else { return }
        try? context.save()
    }
}
