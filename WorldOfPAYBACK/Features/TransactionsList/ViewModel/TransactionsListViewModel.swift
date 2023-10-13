//
//  TransactionsListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import SwiftUI

final class TransactionsListViewModel: ObservableObject {
    private let transactionLoader: TransactionLoading

    @Published var transactions: [Transaction] = []
    @Published var filteredTransactions: [Transaction] = []
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var selectedCategory = -1
    @Published var categories: Set<Int> = []
    @Published var selectedTransaction: Transaction?
    @Published var transactionCurrency: String = ""
    
    var categoryLabelText: (Int) -> String {
        return { category in
            if category == -1 {
                return "all".localized
            } else {
                return "\("category".localized) \(category)"
            }
        }
    }

    init(transactionLoader: TransactionLoading) {
        self.transactionLoader = transactionLoader
        Task {
            await loadTransactions()
        }
    }

    @MainActor func loadTransactions() async {
        isLoading = true
        isError = false
        do {
            transactions = try await transactionLoader.loadTransactions()
            extractCategories()
            extractCurrency()
            filterTransactions()
        } catch {
            isError = true
        }
        isLoading = false
    }

    func filterTransactions() {
        let sortedTransactions = transactions.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
        
        if selectedCategory > 0 {
            filteredTransactions = sortedTransactions.filter { $0.category == selectedCategory }
        } else {
            filteredTransactions = sortedTransactions
        }
    }

    func displaySum() -> String {
        let sum = Transaction.calculateSum(transactions: filteredTransactions)
        return NumberFormatter.currencyFormatter(amount: sum, currency: transactionCurrency)
    }
    
    private func extractCategories() {
        categories = Set(transactions.map { $0.category })
        categories.insert(-1)
    }
    
    private func extractCurrency() {
        if let firstTransaction = transactions.first {
            transactionCurrency = firstTransaction.transactionDetail.value.currency
        }
    }
}
