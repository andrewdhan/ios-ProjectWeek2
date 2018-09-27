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
        setup()
        setupView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTransaction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.addDetailView.alpha = 1
             self.itemNameInputField.becomeFirstResponder()
        }) { (_) in
           
        }
        
        
    }
    //MARK: - Setup
    private func setup(){

        addButton.setTitleColor(UIColor.white, for: .normal)
        addButton.backgroundColor = Appearance.mainColor
        addButton.layer.cornerRadius = addButton.frame.height/5
        addButton.clipsToBounds = true
        amountLabel.text = "0"
        decimalLabel.text = "00"
    }
    
    //MARK: - AddDetailView Methods
    private func setupView(){
        //set up view that pops up
        view.addSubview(addDetailView)
        addDetailView.alpha = 0
        
        //set up constraints
        addDetailView.translatesAutoresizingMaskIntoConstraints = false
        let centerX = addDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let top = addDetailView.topAnchor.constraint(equalTo: view.topAnchor)
        let width = addDetailView.widthAnchor.constraint(equalToConstant: view.frame.width)
        let height = addDetailView.heightAnchor.constraint(equalToConstant: view.frame.height/3+50)
        NSLayoutConstraint.activate([centerX,top, width, height])
        
        //set up colors
        addDetailView.backgroundColor = UIColor(red: 30.0/265.0, green: 101.0/265.0, blue: 109.0/265.0, alpha: 0.95)
        confirmLabel.setTitleColor(Appearance.lightColor, for: .normal)
        cancelLabel.setTitleColor(Appearance.lightColor, for: .normal)
        questionField.textColor = Appearance.lightColor
        segmentedControl.tintColor = Appearance.lightColor
    
        itemNameInputField.backgroundColor = Appearance.lightColor
        itemNameInputField.textColor = Appearance.mainColor
        
        //make default option no for fivolous
        segmentedControl.selectedSegmentIndex = 1
    }
    
    @IBAction func cancel(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.addDetailView.alpha = 0
        }
       digitAccumulator.clear()
        itemNameInputField.resignFirstResponder()
        
    }
    
    @IBAction func confirm(_ sender: Any) {
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
    
    //Oulets for addDetailView Elements
    @IBOutlet var addDetailView: UIView!
    
    @IBOutlet weak var itemNameInputField: UITextField!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var cancelLabel: UIButton!
    @IBOutlet weak var confirmLabel: UIButton!
    
    //Outlets for View Elements
    @IBOutlet weak var currencySign: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var currencyDecimalSeparatorLabel: UIButton!
}
