//
//  DateFormatter+MediumFormattedDate.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import Foundation

extension DateFormatter {
    static func mediumFormattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = .current
        return formatter.string(from: date)
    }
}
