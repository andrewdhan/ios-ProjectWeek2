//
//  CoreDataStack.swift
//  SavingsTracker
//
//  Created by Andrew Liao on 9/24/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavingsTracker")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Error loading persistent store: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
            return container.viewContext
    }
}
