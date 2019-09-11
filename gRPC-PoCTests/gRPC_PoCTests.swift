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
        
        guard let latestBlock = try? ServiceHelper.shared.latestBlock() else {
            XCTFail("failed to get latest block")
            return
        }
        
        // and that it has a non-zero size
        XCTAssert(latestBlock.height > 0)
        
    }
    
    func testBlockRangeService() {

        let expect = XCTestExpectation(description: self.debugDescription)
        
        let _ = try? ServiceHelper.shared.getAllBlocksSinceSaplingLaunch(){ result in
            print(result)
            expect.fulfill()
            XCTAssert(result.success)
            XCTAssertNotNil(result.resultData)
        }
    }
    
    func testBlockRangeServiceTilLastest() {
        let expect = XCTestExpectation(description: self.debugDescription)
        
        guard let latestBlock = try? ServiceHelper.shared.latestBlock() else {
            XCTFail("failed to get latest block")
            return
        }
        
        let _ = try? ServiceHelper.shared.getBlockRange(startHeight: BlockID.saplingActivationHeight, endHeight: latestBlock.height) { result in
            expect.fulfill()
            XCTAssert(result.success)
            XCTAssertNotNil(result.resultData)
        }
    }
}
