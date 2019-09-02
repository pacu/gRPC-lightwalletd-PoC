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
    
    static func launch() {
        let addr = Constants.address
        
        UserDefaults.standard.set(addr, forKey: lightwalletdKey)
        UserDefaults.standard.synchronize()
    }
    
    static var address: String {
        UserDefaults.standard.object(forKey: lightwalletdKey) as? String ?? ""
    }
}
class ServiceHelper {
    static let shared = ServiceHelper()
    
    let compactTxStreamer: CompactTxStreamerServiceClient
    private init() {
       compactTxStreamer = CompactTxStreamerServiceClient(address: Environment.address, secure: false, arguments:[])
        
    }
    
}

extension ServiceHelper {
    func latestBlock() throws -> BlockID {
        try compactTxStreamer.getLatestBlock(ChainSpec())
    }
}

