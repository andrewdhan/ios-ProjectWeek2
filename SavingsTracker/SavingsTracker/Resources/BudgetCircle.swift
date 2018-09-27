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
        originalWidth = self.frame.width
        setupCircle()
    }
    
    func setupCircle(){
        
        translatesAutoresizingMaskIntoConstraints = false
        let height = heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0)
        NSLayoutConstraint.activate([ height])
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        backgroundColor = Appearance.mainColor
        
    }
    
    func animate(percent reduction: CGFloat) {
        var newFrame = self.frame
        newFrame.size.width = originalWidth - originalWidth/4 * reduction
        newFrame.size.height = originalWidth - originalWidth/4 * reduction
        UIView.animate(withDuration: 2) {
            self.frame = newFrame
        }
    }
    
    private var originalWidth: CGFloat!
}
