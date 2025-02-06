//
//  BillSetings.swift
//  Tipsy
//
//  Created by Dimitris on 16/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

enum TipPercentage: Double {
    case zero = 0.0
    case five = 0.05
    case ten = 0.10
    case twenty = 0.20
}
struct BillSettings {
    var tipPercentage: TipPercentage
    var tipRaw: Double
    var splitBetweenPeople: Int
    var totalBill: Double
    var splitBill : Double
}
