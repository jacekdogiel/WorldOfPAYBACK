//
//  TransactionsListViewModelTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Jacek Dogiel on 12/10/2023.
//

import XCTest
@testable import WorldOfPAYBACK

class TransactionsListViewModelTests: XCTestCase {
    var viewModel: TransactionsListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TransactionsListViewModel(transactionLoader: MockTransactionLoader())
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadTransactionsSuccess() async throws {
        await viewModel.loadTransactions()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.isError)
        XCTAssertTrue(viewModel.transactions.count > 0)
    }
    
    func testLoadTransactionsFailure() async throws {
        viewModel = TransactionsListViewModel(transactionLoader: MockTransactionLoader(showError: true))

        await viewModel.loadTransactions()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.isError)
        XCTAssertTrue(viewModel.transactions.isEmpty)
    }

    func testFilterTransactions() async throws {
        await viewModel.loadTransactions()

        viewModel.selectedCategory = 1
        viewModel.filterTransactions()
        XCTAssertTrue(viewModel.filteredTransactions.allSatisfy { $0.category == 1 })

        viewModel.selectedCategory = -1
        viewModel.filterTransactions()
        XCTAssertEqual(viewModel.filteredTransactions, viewModel.transactions)
    }

    func testDisplaySum() async throws {
        await viewModel.loadTransactions()

        let sumForAll = viewModel.displaySum()
        XCTAssertNotNil(sumForAll)

        viewModel.selectedCategory = 1
        viewModel.filterTransactions()
        let sumForCategory = viewModel.displaySum()
        XCTAssertNotNil(sumForCategory)
    }

    func testExtractCategoriesAndCurrency() async throws {
        await viewModel.loadTransactions()

        XCTAssertTrue(viewModel.categories.contains(1))
        XCTAssertFalse(viewModel.transactionCurrency.isEmpty)
    }

    func testSelectTransaction() async throws {
        await viewModel.loadTransactions()

        guard let firstTransaction = viewModel.transactions.first else {
            XCTFail("No transactions available for testing")
            return
        }

        viewModel.selectedTransaction = firstTransaction
        XCTAssertEqual(viewModel.selectedTransaction, firstTransaction)
    }

    func testDisplaySumWithEmptyTransactions() {
        viewModel.transactions = []
        viewModel.filterTransactions()
        let sumForEmptyList = viewModel.displaySum()
        XCTAssertEqual(sumForEmptyList, NumberFormatter.currencyFormatter(amount: 0, currency: ""))
    }

    func testDisplaySumWithVariousTransactionAmounts() async throws {
        await viewModel.loadTransactions()

        let sumForVariousAmounts = viewModel.displaySum()
        let expectedSum: Decimal = 5770.00
        XCTAssertEqual(sumForVariousAmounts, NumberFormatter.currencyFormatter(amount: expectedSum, currency: viewModel.transactionCurrency))
    }
}
