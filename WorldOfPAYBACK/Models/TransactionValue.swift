//
//  TransactionValue.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import Foundation

struct TransactionValue: Decodable {
    let amount: Decimal
    let currency: String
}

extension TransactionValue {
    func formattedAmount() -> String {
        return NumberFormatter.currencyFormatter(amount: amount, currency: currency)
    }
}
