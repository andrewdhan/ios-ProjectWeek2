//
//  WeeklySavings+Convenience.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData

extension WeeklySavings{
    @discardableResult convenience init(amount: Double, weekNumber: Int, isWeekComplete: Bool = false, context:NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.amountRepresentation = Int32(abs(amount*100))
        self.weekNumber = Int16(weekNumber)
        self.isOverspent = amount<0 ? true : false
        self.isWeekComplete = isWeekComplete
        
    }
 
    func amount() ->NSDecimalNumber {
        let number = UInt64(abs(self.amountRepresentation))
        return NSDecimalNumber(mantissa: number, exponent: -2, isNegative: self.isOverspent)
    }

}
