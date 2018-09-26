//
//  WeeklySavingsController.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//
import Foundation
import CoreData

private let moc = CoreDataStack.shared.mainContext
class WeeklySavingsController{
    
    static let shared = WeeklySavingsController()
    
    init(){
    }
    //MARK: - CRUD
    func create(amount: Double, weekNumber: Int, context: NSManagedObjectContext = moc){
        guard amount.isCurrencyValue() else {
            NSLog("Not currency value")
            return
        }
        WeeklySavings(amount: amount, weekNumber: weekNumber, context: context)
        save()
    }
    func delete(weeklySavings: WeeklySavings, context:NSManagedObjectContext = moc){
        context.delete(weeklySavings)
        save()
    }
    func add(transaction:Transaction, to weeklySavings: WeeklySavings){
        let newAmount = weeklySavings.amount().adding( transaction.transactionAmount())
        weeklySavings.amountRepresentation = newAmount.multiplying(by: 100).int32Value
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
}
