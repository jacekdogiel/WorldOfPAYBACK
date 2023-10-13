//
//  MockTransactionLoader.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import Foundation

enum TransactionLoaderError: Error {
    case randomError
    case fileNotFound
}

struct MockTransactionLoader: TransactionLoading {
    var sleepTime: UInt64
    var showError: () -> Bool
    
    init(sleepTime: UInt64  = 0, showError: @autoclosure @escaping () -> Bool = false) {
        self.sleepTime = sleepTime
        self.showError = showError
    }
    
    func loadTransactions() async throws -> [Transaction] {
        try await Task.sleep(nanoseconds: sleepTime)
        
        if showError() {
            throw TransactionLoaderError.randomError
        }
        
        if let path = Bundle.main.path(forResource: Constants.filename, ofType: Constants.fileType) {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(TransactionsResponse.self, from: data)
            return response.items
        } else {
            throw TransactionLoaderError.fileNotFound
        }
    }
    
    struct Constants {
        static let domain = "App"
        static let filename = "PBTransactions"
        static let fileType = "json"
    }
}
