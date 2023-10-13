//
//  ListRouterTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Jacek Dogiel on 12/10/2023.
//

import XCTest
@testable import WorldOfPAYBACK

class ListRouterTests: XCTestCase {
    var router: ListRouter!

    override func setUp() {
        super.setUp()
        router = ListRouter()
    }
    
    override func tearDown() {
        router = nil
        super.tearDown()
    }

    func testNavigateToDetail() {
        router.navigateToDetail()

        XCTAssertEqual(router.currentView, .detail)
    }

    func testNavigateBack() {
        router.navigateToDetail()

        router.navigateBack()

        XCTAssertEqual(router.currentView, .list)
    }

    func testNavigateBackWithEmptyStack() {
        router.navigateBack()

        XCTAssertEqual(router.currentView, .list)
    }

    func testMultipleNavigationsAndBack() {
        router.navigateToDetail()
        router.navigateToDetail()
        router.navigateToDetail()

        XCTAssertEqual(router.currentView, .detail)

        router.navigateBack()
        router.navigateBack()

        XCTAssertEqual(router.currentView, .list)
    }
}

