//
//  Double.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

extension Double {
    
    private var percentFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }
    
    func asPercentString() -> String {
        let number = NSNumber(value: self)
        return percentFormatter.string(from: number) ?? "0.0%"
    }
    
}
