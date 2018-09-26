//
//  Transaction+Convenience.swift
//  SavingsTracker
//
//  Created by Andrew Liao on 9/24/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData

extension Transaction {
      @discardableResult convenience init(amount: Double, category: String, frivolous: Bool = false, date: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.amountRepresentation = -Int32(abs(amount*100))
        self.category = category
        self.frivolous = frivolous
        self.date = date
        self.weekNumber = Int16(date.weekNumber())
    }
    
    //Transactions are always negative
    func transactionAmount() ->NSDecimalNumber {
        let number = UInt64(abs(self.amountRepresentation))
        return NSDecimalNumber(mantissa: number, exponent: -2, isNegative: true)
    }
    
}

extension Date {
     func weekNumber() -> Int{
        return Calendar.current.component(.weekOfYear, from: self)
 
    }
}
