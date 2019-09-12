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
    
    static var latestBlock: BlockID = try! ServiceHelper.shared.latestBlock()

    func testEnvironmentLaunch() {
        
        let address = gRPC_PoC.Environment.address
        
        XCTAssertFalse(address.isEmpty, "Your \'\(Environment.lightwalletdKey)\' key is missing from your launch environment variables")
    }
    
    func testService() {
   
        // and that it has a non-zero size
        XCTAssert(Self.latestBlock.height > 0)
        
    }
    
    func testBlockRangeService() {

        let expect = XCTestExpectation(description: self.debugDescription)
        let _ = try? ServiceHelper.shared.getAllBlocksSinceSaplingLaunch(){ result in
            print(result)
            expect.fulfill()
            XCTAssert(result.success)
            XCTAssertNotNil(result.resultData)
        }
        wait(for: [expect], timeout: 10)
    }
    
    func testBlockRangeServiceTilLastest() {
        let expectedCount: UInt64 = 99
        var count: UInt64 = 0
        let expect = XCTestExpectation(description: self.debugDescription)
        
        let startHeight = Self.latestBlock.height - expectedCount
        let endHeight = Self.latestBlock.height
        guard let call = try? ServiceHelper.shared.getBlockRange(startHeight: startHeight, endHeight: endHeight,result: {
            result in
                       XCTAssert(result.success)
                   
        }) else {
            XCTFail("failed to create getBlockRange( \(startHeight) ..<= \(endHeight)")
            return
        }
        wait(for: [expect], timeout: 20)
        
        while let _ = try? call.receive() {
            expect.fulfill()
            count += 1
        }
        
        XCTAssertEqual(expectedCount + 1, count)
        
    }
    
}
