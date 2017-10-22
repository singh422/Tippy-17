//
//  CalculatorViewController.swift
//  Tippy
//
//  Created by Avinash Singh on 21/10/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextViewDelegate  {

    @IBOutlet weak var amountFor4Label: UILabel!
    @IBOutlet weak var amountFor2Label: UILabel!
    @IBOutlet weak var amountFor3Label: UILabel!
    @IBOutlet weak var amountFor1Label: UILabel!
    @IBOutlet weak var divisionView: UIView!
    @IBOutlet weak var billAmountInput: UITextView!
    @IBOutlet weak var totalAmountView: UITextView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    let tipPercentages = [0.18, 0.2, 0.25]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountInput.delegate = self
        billAmountInput.text = "$0.00"
        calculateTip(self)
        billAmountInput.isScrollEnabled = false
        totalAmountView.isScrollEnabled = false
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) { //Handle
        billAmountInput.text = ""
        totalAmountView.text = "$0.00"
        tipAmountLabel.text = "$0.00"
        divisionView.isHidden = true

    }

    
    func textViewDidChange(_ textView: UITextView) { //Handle
//        print(textView.text);
        
         calculateTip(self)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print(billAmountInput.text)
        if billAmountInput.text == ""{
            billAmountInput.text = "$"
            totalAmountView.text = "$0.00"
            tipAmountLabel.text = "$0.00"
        }
        
        
    }

    
    @IBAction func calculateTip(_ sender: AnyObject) {
       
        let bill = Double(billAmountInput.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f",tip)
        totalAmountView.text = String(format: "$%.2f",total)
        
        amountFor1Label.text = String(format: "$%.2f",total)
        amountFor2Label.text = String(format: "$%.2f",total/2)
        amountFor3Label.text = String(format: "$%.2f",total/3)
        amountFor4Label.text = String(format: "$%.2f",total/4)
        
    }
    
    
    @IBAction func onTapRemoveKeyboard(_ sender: UITapGestureRecognizer) {
        billAmountInput.endEditing(true)
        divisionView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = Foundation.UserDefaults.standard
        let tipValue = defaults.integer(forKey: "default_tip_percentage")
        tipControl.selectedSegmentIndex = tipValue
        super.viewWillAppear(animated)
        calculateTip(self)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
