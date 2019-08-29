//
//  gRPC_PoCTests.swift
//  gRPC-PoCTests
//
//  Created by Francisco Gindre on 28/08/2019.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import XCTest
@testable import gRPC_PoC

class gRPC_PoCTests: XCTestCase {


    func testEnvironmentLaunch() {
        
        let address = gRPC_PoC.Environment.address
        
        XCTAssertFalse(address.isEmpty, "Your \'\(Environment.lightwalletdKey)\' key is missing from your launch environment variables")
    }
    
    func testService() {
        
        let latestBlock = try? ServiceHelper.shared.latestBlock()
        
        // Check that your block has been retrieved
        XCTAssertNotNil(latestBlock)
        
        // and that it has a non-zero size
        XCTAssert(latestBlock!.height > 0)
        
    }
}
