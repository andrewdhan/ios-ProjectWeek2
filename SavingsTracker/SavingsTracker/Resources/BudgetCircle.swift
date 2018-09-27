//
//  BudgetCircle.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/27/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

@IBDesignable class BudgetCircle: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup(){
        setupCircle()
    }
    
    func setupCircle(){
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        backgroundColor = Appearance.mainColor
        
    }
}
