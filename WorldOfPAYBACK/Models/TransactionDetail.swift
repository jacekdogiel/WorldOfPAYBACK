//
//  TransactionDetail.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import Foundation

struct TransactionDetail: Decodable {
    let description: String?
    let bookingDate: Date
    let value: TransactionValue
}

extension TransactionDetail {
    func mediumFormattedBookingDate() -> String {
        return DateFormatter.mediumFormattedDate(date: bookingDate)
    }
}
