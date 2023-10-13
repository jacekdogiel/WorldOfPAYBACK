//
//  DateFormatterTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Jacek Dogiel on 12/10/2023.
//

import XCTest
@testable import WorldOfPAYBACK

class DateFormatterTests: XCTestCase {
    
    func testMediumFormattedDate() {
        let dateString = "2022-07-24T10:59:05+0200"
        let dateFormatter = ISO8601DateFormatter()
        
        guard let date = dateFormatter.date(from: dateString) else {
            XCTFail("Failed to create date from string")
            return
        }

        let locale = Locale(identifier: "en_US")
        let formattedString = DateFormatter.mediumFormattedDate(
            date: date,
            locale: locale
        )

        XCTAssertFalse(formattedString.isEmpty)
        XCTAssertEqual(formattedString, "Jul 24, 2022 at 10:59:05 AM")
    }
}
