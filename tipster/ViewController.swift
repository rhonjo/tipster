//
//  ViewController.swift
//  tipster
//
//  Created by Ryota Honjo on 5/5/15.
//  Copyright (c) 2015 Ryota Honjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var tipSliderLabel: UILabel!
    @IBOutlet weak var groupSizeSliderLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        perPersonLabel.text = "$0.00"
        groupSizeSliderLabel.text = "1"
       
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tipSliderOnValueChanged(sender: UISlider) {
        var currentTipValue = Int(tipSlider.value)
        tipSliderLabel.text = "\(currentTipValue)%"
        reload()
    }
    @IBAction func groupSizeSliderOnValueChanged(sender: UISlider) {
        var currentGroupValue = Int(groupSizeSlider.value)
        groupSizeSliderLabel.text = "\(currentGroupValue)"
        reload()
    }
    func reload()
    {
        var billAmount = (billField.text as NSString).doubleValue
        var grpsize = round(Double(groupSizeSlider.value))
        var tipconvert = Double(tipSlider.value)/100
        var tip = billAmount * tipconvert
        var total = billAmount + tip
        var perPerson = (billAmount + tip) / grpsize
        
        var tipfinal = String(format: "%.2f", tip)
        var totalfinal = String(format: "%.2f", total)
        var perPersonfinal = String(format: "%.2f", perPerson)
        
        tipLabel.text = "$\(tipfinal)"
        totalLabel.text = "$\(totalfinal)"
        perPersonLabel.text = "$\(perPersonfinal)"
    }
    
    @IBAction func BillEditChanged(sender: UITextField) {
        reload()
    }
}

