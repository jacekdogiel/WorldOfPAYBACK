//
//  MockTransactionLoader.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import Foundation

struct MockTransactionLoader: TransactionLoading {
    func loadTransactions() async throws -> [Transaction] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        if Bool.random() {
            throw NSError(domain: "App", code: 500, userInfo: [NSLocalizedDescriptionKey: "Random error occurred"])
        }
        
        if let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(TransactionsResponse.self, from: data)
            return response.items
        } else {
            throw NSError(domain: "App", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
    }
}
