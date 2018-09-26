//
//  TransactionController.swift
//  SavingsTracker
//
//  Created by Andrew Liao on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData

private let moc = CoreDataStack.shared.mainContext
class TransactionController{
    
    static let shared = TransactionController()
    
    
    init(){
    }
    //MARK: - CRUD
    func create(amount: Double, category: String = "Any", context: NSManagedObjectContext = moc) -> Transaction?{
        guard amount.isCurrencyValue() else {
            NSLog("Not currency value")
            return nil
        }
        let transaction = Transaction(amount: amount, category: category, context : context)
        save()
        return transaction
    }
    func delete(transaction: Transaction, context:NSManagedObjectContext = moc){
        context.delete(transaction)
        save()
    }
    
    //MARK: - Helper Method
    func save(context: NSManagedObjectContext = moc){
        context.perform {
            do {
                try context.save()
            } catch {
                NSLog("Error saving to Core Data \(error)")
                context.reset()
                return
            }
        }
    }
    
    //MARK: - Properties
    private var transactions = [Transaction]()
}

extension Double{
    func isCurrencyValue() -> Bool{
        return self.exponent == -2 ? true : false
    }
}
