//
//  AddTransactionViewController.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTransaction(_ sender: Any) {
        guard let amountString = amountLabel.text,
            let amount = Double(amountString),
        let currentWeekSavings = currentWeekSavings,
         let transaction = TransactionController.shared.create(amount: amount)else {return}
       
        WeeklySavingsController.shared.add(transaction: transaction, to: currentWeekSavings)
        
    }
    @IBAction func toggleFrivolous(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var frivolousButton: UIButton!
    
    private let weeklySavingsController = WeeklySavingsController()
    private var currentWeekSavings: WeeklySavings? = nil
}
