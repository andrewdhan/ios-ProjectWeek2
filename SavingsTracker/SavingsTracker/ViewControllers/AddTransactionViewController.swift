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
            let title = titleLabel.text,
            let transaction = TransactionController.shared.create(amount: amount, title: title, isFrivolous: isFrivolousChecked) else {return}
        
        WeeklySavingsController.shared.add(transaction: transaction, to: currentWeekSavings)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func toggleFrivolous(_ sender: Any) {
        guard isViewLoaded else {return}
        if isFrivolousChecked{
            frivolousButton.setTitle("", for: .normal)
        } else {
            frivolousButton.setTitle("X", for: .normal)
        }
        isFrivolousChecked = !isFrivolousChecked
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var frivolousButton: UIButton!
    
    private var isFrivolousChecked = false
    private let weeklySavingsController = WeeklySavingsController()
    var currentWeekSavings: WeeklySavings? = nil
}
