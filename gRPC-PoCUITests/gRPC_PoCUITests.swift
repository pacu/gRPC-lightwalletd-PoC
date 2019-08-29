//
//  gRPC_PoCUITests.swift
//  gRPC-PoCUITests
//
//  Created by Francisco Gindre on 28/08/2019.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import XCTest

class gRPC_PoCUITests: XCTestCase {

    func testGetLatestBlock() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCTAssertNotNil(app.staticTexts.firstMatch.accessibilityLabel)
        
        XCTAssert(app.staticTexts.firstMatch.accessibilityLabel!.contains("block height:"))
        
    }
}
