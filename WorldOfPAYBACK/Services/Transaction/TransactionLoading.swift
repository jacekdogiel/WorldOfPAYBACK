//
//  TransactionLoading.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

protocol TransactionLoading {
    func loadTransactions() async throws -> [Transaction]
}
