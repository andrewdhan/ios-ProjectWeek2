//
//  AddTransactionViewController.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/26/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = "0"
        decimalLabel.text = "00"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTransaction(_ sender: Any) {
        print(digitAccumulator.stringValue())
    }
    //MARK: - Numberpad Button Actions
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        try? digitAccumulator.add(digit: .number(sender.tag))
    }
    @IBAction func decimalTapped(_ sender: UIButton) {
        try? digitAccumulator.add(digit: .decimalPoint)
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        try? digitAccumulator.delete()
    }
    
    
    
    
    //MARK: - Properties
    private var digitAccumulator = DigitAccumulator() {
        didSet {
            let wholeValue = digitAccumulator.wholeStringValue()
            let text = !wholeValue.isEmpty ? wholeValue : "0"
            amountLabel.text = text
            decimalLabel.text = digitAccumulator.fractionalStringValue()
        }
    }
    
    var currentWeekSavings: WeeklySavings? = nil
    
    @IBOutlet weak var currencySign: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var decimalLabel: UILabel!
}
