//
//  MonthlySavings+Convenience.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData


extension MonthlySavings{
    convenience init(amount: Double, month: Int, isWeekComplete: Bool = false, context:NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.amountRepresentation = Int32(abs(amount*100))
        self.month = Int16(month)
        self.isOverspent = amount<0 ? true : false
        self.isMonthComplete = isWeekComplete
        
    }
    
    func amount() ->NSDecimalNumber {
        let number = UInt64(abs(self.amountRepresentation))
        return NSDecimalNumber(mantissa: number, exponent: -2, isNegative: self.isOverspent)
    }
    
}
