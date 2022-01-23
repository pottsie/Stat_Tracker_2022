//
//  Date.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

extension Date {
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, y"
        return formatter.string(from: self)
    }

    init(_ dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}
