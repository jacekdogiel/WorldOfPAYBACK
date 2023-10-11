//
//  NumberFormatter+CurrencyFormatting.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import Foundation

extension NumberFormatter {
    static func currencyFormatter(amount: Decimal, currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        formatter.locale = .current
        return formatter.string(from: NSDecimalNumber(decimal: amount)) ?? "\(amount) \(currency)"
    }
}
