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
    @discardableResult func create(amount: Double, weekNumber: Int, context: NSManagedObjectContext = moc) -> WeeklySavings{
        guard amount.isCurrencyValue() else {
            fatalError("Not currency value")
        }
        let result = WeeklySavings(amount: amount, weekNumber: weekNumber, context: context)
        save()
        return result
    }
    func delete(weeklySavings: WeeklySavings, context:NSManagedObjectContext = moc){
        context.delete(weeklySavings)
        save()
    }
    func add(transaction:Transaction, to weeklySavings: WeeklySavings){
        let newAmount = weeklySavings.amount().adding( transaction.transactionAmount())
        weeklySavings.amountRepresentation = newAmount.multiplying(by: 100).int32Value
        weeklySavings.isOverspent = newAmount.decimalValue < 0 ? true : false
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
