//
//  ViewController.swift
//  tips
//
//  Created by Shaz Rajput on 7/1/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var total = 0.0
    var tip = 0.0
    let tipPercentages = [0.18, 0.2, 0.22]
    let defaultTipAmountIndex = 1
    let defaultTipAmountKey = "defaultTipAmount"
    let defaults = NSUserDefaults.standardUserDefaults()
    let currencyFormatter = NSNumberFormatter()
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        billField.becomeFirstResponder()
        currencyFormatter.numberStyle = .CurrencyStyle
        
        let defaultTipAmountIndexNSNumber = defaults.objectForKey(defaultTipAmountKey) as? NSNumber
        
        if (defaultTipAmountIndexNSNumber == nil){
            defaults.setInteger(defaultTipAmountIndex, forKey: defaultTipAmountKey)
            tipControl.selectedSegmentIndex = defaultTipAmountIndex
        } else {
            let index = defaultTipAmountIndexNSNumber!.integerValue
            tipControl.selectedSegmentIndex = index
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var billAmount = 0.0
        
        if !(billField.text!.isEmpty){
            billAmount = Double(billField.text!)!
        }
        
        tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        total = billAmount + tip
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        /* 
        I know I can change my tipControl index here to reflect new default setting.
        However, I don't think it is correct to change value at this time. 
        Example flow:
        User taps on icon to open app
        She is happy with her current service, sets value to 22%. 
        She notices settings page and checks it out
        Ah, she sets default to 20% and goes back to main view
        Now, she is ready to write down her tip.. oh wait, why has the value decreased?? 
        
        Setting default should not influence current session. But hey, I could be wrong, 
        this is why I am taking this class!
        */
    }
}

