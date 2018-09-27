//
//  MainViewController.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit
import CoreData


private let moc = CoreDataStack.shared.mainContext
class MainViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    override func viewDidLoad() {
        view.backgroundColor = Appearance.lightColor
        amountLeftLabel.backgroundColor = Appearance.lightColor
        amountLeftLabel.textColor = Appearance.mainColor
        amountLeftLabel.clipsToBounds = true
        amountLeftLabel.layer.cornerRadius = amountLeftLabel.frame.height/5
    }
    func updateView(){
        amountLeftLabel.text = currentWeekSavings.amount().currencyStringValue()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTransaction"{
            let destinationVC = segue.destination as! AddTransactionViewController
            destinationVC.currentWeekSavings = currentWeekSavings
        }
    }
 

    
    //MARK: - Properties
    @IBOutlet weak var amountLeftLabel: UILabel!
    @IBOutlet weak var weekTrackerLabel1: UIView!
    @IBOutlet weak var weekTrackerLabel2: UIView!
    @IBOutlet weak var weekTrackerLabel3: UIView!
    @IBOutlet weak var weekTrackerLabel4: UIView!
    
    lazy var currentWeekSavings:WeeklySavings = {
        let request: NSFetchRequest<WeeklySavings> = WeeklySavings.fetchRequest()
        let weekNumber = Date().weekNumber()
        request.predicate = NSPredicate(format: "weekNumber == %@", NSNumber(value: weekNumber))
        
        var result: WeeklySavings? = nil
        
        do {
            result = try moc.fetch(request).first
        } catch {
            NSLog("Error fetching single entry: \(error)")
        }
        return result ?? weeklySavingsController.create(amount: weeklyBudget, weekNumber: Date().weekNumber())
    }()
    
    private let weeklyBudget = 100.00
    private let weeklySavingsController = WeeklySavingsController.shared
    private let transactionController = TransactionController.shared
    
}
