//
//  TransactionRemoteService.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import Foundation

enum TransactionRemoteServiceError: Error {
    case invalidURL
}

final class TransactionRemoteService: TransactionLoading {
    private let baseURL: String

    init(environment: AppEnvironment) {
        self.baseURL = environment.configuration.baseURL
    }

    func loadTransactions() async throws -> [Transaction] {
        let endpointURL = "\(baseURL)/\(Constants.endpoint)"

        guard let url = URL(string: endpointURL) else {
            throw TransactionRemoteServiceError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let response = try decoder.decode(TransactionsResponse.self, from: data)
        return response.items
    }
    
    struct Constants {
        static let domain = "App"
        static let endpoint = "transactions"
    }
}
