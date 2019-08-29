//
//  ContentView.swift
//  gRPC-PoC
//
//  Created by Francisco Gindre on 28/08/2019.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        guard let blockID = try? ServiceHelper.shared.latestBlock() else {
            
            return Text("getLatestBlock failed")
        }
        
        return Text("block height: \(blockID.height)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
