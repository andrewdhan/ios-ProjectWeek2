//
//  MainViewController.swift
//  SavingsTracker
//
//  Created by Andrew Dhan on 9/25/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var amountLeftLabel: UILabel!
    @IBOutlet weak var weekTrackerLabel1: UIView!
    @IBOutlet weak var weekTrackerLabel2: UIView!
    @IBOutlet weak var weekTrackerLabel3: UIView!
    @IBOutlet weak var weekTrackerLabel4: UIView!
    
}