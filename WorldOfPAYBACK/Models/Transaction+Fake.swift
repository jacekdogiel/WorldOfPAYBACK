//
//  Transaction+Fake.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 13/10/2023.
//

import Foundation

extension Transaction {
    static let fake = Transaction(
        partnerDisplayName: "REWE Group",
        category: 1,
        transactionDetail: TransactionDetail(
            description: "Punkte sammeln",
            bookingDate: Date(),
            value: TransactionValue(
                amount: 124,
                currency: "PBP")))
}
