//
//  TransactionValue.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import Foundation

struct TransactionValue: Decodable, Equatable {
    let amount: Decimal
    let currency: String
}

extension TransactionValue {
    var formattedAmount: String {
        return NumberFormatter.currencyFormatter(amount: amount, currency: currency)
    }
}
