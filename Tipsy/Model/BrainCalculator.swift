//
//  BrainCalculator.swift
//  Tipsy
//
//  Created by Dimitris on 16/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct BrainCalculator {
    private var settings: BillSettings?

    mutating func getdefault () -> BillSettings {
        let defaultSettings = BillSettings.init(tipPercentage: TipPercentage.five,tipRaw: 0.0, splitBetweenPeople: 4, totalBill: 0.0,  splitBill: 0.0 )
        settings = defaultSettings
        return defaultSettings
    }

    mutating func setTip(_ tip: TipPercentage) {
        settings?.tipPercentage = tip
    }
    mutating func setTipRaw(_ tip: Double) {
        settings?.tipRaw = tip
    }

    mutating func setSplit( _ split: Int) {
        settings?.splitBetweenPeople = split
    }
    mutating func setBill( _ bill: Double) {
        settings?.totalBill = bill
    }
    mutating func setSplitBill( _ bill: Double) {
        settings?.splitBill = bill
    }

    mutating func calculate() {
        let settings = self.getSettings()
        let tipraw = settings.totalBill * settings.tipPercentage.rawValue
        self.setTipRaw(tipraw)
        
        let splitBill = ((settings.totalBill+tipraw)/Double(settings.splitBetweenPeople))
        self .setSplitBill(splitBill)

        print("splitBill: \(splitBill) |  bill: \(settings.totalBill) | tip%: \(settings.tipPercentage) | splitbetween: \(settings.splitBetweenPeople)" )
    }
    
    mutating func getSettings() -> BillSettings {
        return (settings ?? self.getdefault())
    }
}
