//
//  NumberFormatterTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Jacek Dogiel on 12/10/2023.
//

import XCTest
@testable import WorldOfPAYBACK

class NumberFormatterTests: XCTestCase {

    var formatter: NumberFormatter!

    override func setUp() {
        super.setUp()
        formatter = NumberFormatter()
    }

    override func tearDown() {
        formatter = nil
        super.tearDown()
    }

    func testCurrencyFormatter() {
        let amount: Decimal = 1234.56
        let currencyCode = "USD"
        
        formatter.locale = Locale(identifier: "en_US")

        let formattedString = NumberFormatter.currencyFormatter(amount: amount, currency: currencyCode)

        XCTAssertFalse(formattedString.isEmpty)
        XCTAssertTrue(formattedString.contains("$"))
        XCTAssertTrue(formattedString.contains("1,234.56"))
    }
    
    func testCurrencyFormatterWithZeroAmount() {
        let amount: Decimal = 0
        let currencyCode = "GBP"
        
        let formattedString = NumberFormatter.currencyFormatter(amount: amount, currency: currencyCode)
        
        XCTAssertFalse(formattedString.isEmpty)
        XCTAssertTrue(formattedString.contains("£"))
        XCTAssertTrue(formattedString.contains("0.00"))
    }
}

