//
//  TransactionDetail.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import Foundation

struct TransactionDetail: Decodable, Equatable {
    let description: String?
    let bookingDate: Date
    let value: TransactionValue
}

extension TransactionDetail {
    var mediumFormattedBookingDate: String {
        return DateFormatter.mediumFormattedDate(date: bookingDate)
    }
}
