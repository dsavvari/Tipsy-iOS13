//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var braincalc: BrainCalculator = BrainCalculator()
    
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipZeroPcButton: UIButton!
    @IBOutlet weak var tipFivePcButton: UIButton!
    @IBOutlet weak var tipTenPcButton: UIButton!
    @IBOutlet weak var tipTwentyPcButton: UIButton!
    @IBOutlet weak var billSplitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let settings = braincalc.getdefault()
        
        billSplitLabel.text = String(settings.splitBetweenPeople)
        splitStepper.value = Double(settings.splitBetweenPeople)
        
        billTextField.text = String(format: "%.2f",settings.totalBill)
        
        tipZeroPcButton.isSelected = false
        tipFivePcButton.isSelected = false
        tipTenPcButton.isSelected = false
        tipTwentyPcButton.isSelected = false
        
        switch settings.tipPercentage {
        case .zero:
            tipZeroPcButton.isSelected = true
        case .five:
            tipFivePcButton.isSelected = true
        case .ten:
            tipTenPcButton.isSelected = true
        case .twenty:
            tipTwentyPcButton.isSelected = true
        }
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        tipZeroPcButton.isSelected = false
        tipFivePcButton.isSelected = false
        tipTenPcButton.isSelected = false
        tipTwentyPcButton.isSelected = false
        sender.isSelected = true
        
        switch sender {
        case tipZeroPcButton:
            braincalc.setTip(.zero)
        case tipFivePcButton:
            braincalc.setTip(.five)
        case tipTenPcButton:
            braincalc.setTip(.ten)
        case tipTwentyPcButton:
            braincalc.setTip(.twenty)
        default:
            print("ERROR, unexpected item")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        print("stepper: \(sender.value)")
        billSplitLabel.text = String(format: "%.0f",sender.value)
        braincalc.setSplit(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != "" {
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            //e.g. 125.50
            let billTotal = Double(bill)!
            braincalc.setBill(billTotal)
            braincalc.calculate()
            self.performSegue(withIdentifier: "resultsSeque", sender: self)
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "resultsSeque" {
            let destinationVC = segue.destination as! ResultsViewController
        
            destinationVC.settings = braincalc.getSettings()
            
        }
    }
}

