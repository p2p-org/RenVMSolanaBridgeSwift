//
//  File.swift
//  
//
//  Created by Chung Tran on 09/09/2021.
//

import Foundation

public struct LockAndMint {
    let network: Network
    let provider: RenVMProvider
    let session: Session
}

extension LockAndMint {
    public struct State {
        public let gHash: Data
        public let gPubKey: Data
        public let sendTo: PublicKeyType
        public let txid: Data
        public let nHash: Data
        public let pHash: Data
        public let txHash: String
        public let txIndex: String
        public let amount: String
    }
    
    public struct Session {
        init(
            destinationAddress: String,
            nonce: String? = nil,
            sessionDay: Long = Long(Date().timeIntervalSince1970 / 1000 / 60 / 60 / 24),
            expiryTimeInDays: Long = 3,
            gatewayAddress: String = ""
        ) {
            self.destinationAddress = destinationAddress
            self.nonce = nonce ?? Utils.generateNonce(sessionDay: sessionDay)
            self.createdAt = sessionDay
            self.expiryTime = (sessionDay + 3) * 60 * 60 * 24 * 1000
            self.gatewayAddress = gatewayAddress
        }
        
        public private(set) var destinationAddress: String
        public private(set) var nonce: String
        public private(set) var createdAt: Long
        public private(set) var expiryTime: Long
        public internal(set) var gatewayAddress: String
        
    }
}
