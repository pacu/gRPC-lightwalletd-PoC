//
//  ServiceHelper.swift
//  gRPC-PoC
//
//  Created by Francisco Gindre on 29/08/2019.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import Foundation
import SwiftGRPC

class Environment {
    
    static let lightwalletdKey = "LIGHTWALLETD_ADDRESS"
    
    static var address: String {
        return Constants.address
    }
    
}

class ServiceHelper {
    
    static let shared = ServiceHelper()
    
    let compactTxStreamer: CompactTxStreamerServiceClient
    
    private init() {
       compactTxStreamer = CompactTxStreamerServiceClient(address: Environment.address, secure: false, arguments:[])
    }
    
    func getBlockRange(startHeight: UInt64, endHeight: UInt64? = nil,  result: @escaping (CallResult)->()) throws -> CompactTxStreamerGetBlockRangeCall {
           try compactTxStreamer.getBlockRange(BlockRange(startHeight: startHeight, endHeight: endHeight)) { result($0) }
    }
    
    
    
}

extension ServiceHelper {
    
    func latestBlock() throws -> BlockID {
        try compactTxStreamer.getLatestBlock(ChainSpec())
    }
    
    func getTx(hash:String) throws -> RawTransaction {
        var filter = TxFilter()
        filter.hash = Data(hash.utf8)
        return try compactTxStreamer.getTransaction(filter)
    }
    
    func getAllBlocksSinceSaplingLaunch(_ result: @escaping (CallResult)->()) throws -> CompactTxStreamerGetBlockRangeCall {
        try compactTxStreamer.getBlockRange(BlockRange.sinceSaplingActivation(), completion: result)
    }
}


extension Range where Element == UInt64 {
    func blockRange() -> BlockRange {
        BlockRange(startHeight: lowerBound, endHeight: upperBound)
    }
}


extension BlockID {
    
    static let saplingActivationHeight: UInt64 = 280_000
    
    init(height: UInt64) {
        self = BlockID()
        self.height = height
    }
    
    static var saplingActivation: BlockID {
        BlockID(height: saplingActivationHeight)
    }
    
}

extension BlockRange {
    
    init(startHeight: UInt64, endHeight: UInt64? = nil) {
        self = BlockRange()
        self.start =  BlockID(height: startHeight)
        if let endHeight = endHeight {
            self.end = BlockID(height: endHeight)
        }
    }
    
    static func sinceSaplingActivation(to height: UInt64? = nil) -> BlockRange {
       var blockRange = BlockRange()
        
        blockRange.start = BlockID.saplingActivation
        if let height = height {
            blockRange.end = BlockID.init(height: height)
        }
        return blockRange
    }
    
}
