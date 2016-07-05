//
//  SettingsViewContollerViewController.swift
//  tips
//
//  Created by Shaz Rajput on 7/1/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class SettingsViewContollerViewController: UIViewController {

    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultTipAmountKey = "defaultTipAmount"

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaultTipAmountIndexNSNumber = defaults.objectForKey(defaultTipAmountKey) as? NSNumber
        let index = (defaultTipAmountIndexNSNumber?.integerValue)!
        defaultTipControl.selectedSegmentIndex = index
    }

    @IBAction func defaultTipControlOnValueChanged(sender: AnyObject) {
        let index = defaultTipControl.selectedSegmentIndex
        defaults.setInteger(index, forKey: defaultTipAmountKey)
        defaults.synchronize()
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
