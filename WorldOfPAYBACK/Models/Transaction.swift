//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import Foundation

struct Transaction: Identifiable, Decodable {
    let id = UUID()
    let partnerDisplayName: String
    let category: Int
    let transactionDetail: TransactionDetail
    
    private enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case category
        case transactionDetail
    }
}

extension Transaction {
    static func calculateSum(transactions: [Transaction]) -> Decimal {
        return transactions.reduce(Decimal(0)) { $0 + $1.transactionDetail.value.amount }
    }
}
