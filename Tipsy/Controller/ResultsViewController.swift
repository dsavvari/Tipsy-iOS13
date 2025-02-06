//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dimitris on 16/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var settings: BillSettings?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bill = settings?.splitBill
        let people = settings?.splitBetweenPeople
        let tipPrc = settings?.tipPercentage
        let tip = Int(tipPrc!.rawValue*100.00)
        totalLabel.text = String(format: "%.2f",bill!)
        settingsLabel.text = String(format: "Split between %d people, with %d%% tip",people!,tip)
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
