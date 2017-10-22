//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Avinash Singh on 21/10/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
     let tipPercentages = [0.18, 0.2, 0.25]
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = Foundation.UserDefaults.standard
        let tipValue = defaults.integer(forKey: "default_tip_percentage")
        tipControl.selectedSegmentIndex = tipValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultValueChanged(_ sender: Any) {
        let defaults = Foundation.UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    @IBAction func doneButtonOnClick(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
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
