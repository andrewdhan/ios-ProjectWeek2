//
//  Transaction+Convenience.swift
//  SavingsTracker
//
//  Created by Andrew Liao on 9/24/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation
import CoreData

extension Transactions {
    convenience init(amount: Double, category: String, frivolous: Bool = false, date: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.amountRepresentation = Int32(abs(amount*100))
        self.category = category
        self.frivolous = frivolous
        self.date = date
    }
    
    //Transactions are always negative
    func transactionAmount() ->NSDecimalNumber {
        let number = UInt64(self.amountRepresentation)
        return NSDecimalNumber(mantissa: number, exponent: -2, isNegative: true)
    }
}
