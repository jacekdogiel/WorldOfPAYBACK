//
//  TransactionsResponse.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

struct TransactionsResponse: Decodable {
    let items: [Transaction]
}
