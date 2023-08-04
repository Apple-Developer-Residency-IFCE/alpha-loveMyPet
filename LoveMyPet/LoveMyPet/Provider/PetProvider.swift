//
//  PetProvider.swift
//  TestesdoAppPets
//
//  Created by userext on 31/07/23.
//

import Foundation
import CoreData

final class PetProvider {
    static let shared = PetProvider()
    private let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    init (inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "Model")
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistentContainer.loadPersistentStores {_, error in
            if let error {
                fatalError("Não deu certo por que deu: \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}
