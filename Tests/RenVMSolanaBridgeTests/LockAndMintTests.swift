
import Foundation
import XCTest
@testable import RenVMSolanaBridge

class LockAndMintTests: XCTestCase {
    let destinationAddress = "3h1zGmCwsRJnVk5BuRNMLsPaQu1y2aqXqXDWYCgrp5UG"
    private let sessionDay: Long = 18870
    private lazy var session = LockAndMint.Session(
        destinationAddress: destinationAddress,
        sessionDay: sessionDay
    )
    
    func testSession() throws {
        XCTAssertEqual(session.expiryTime, 1630627200000)
        XCTAssertEqual(session.nonce, "2020202020202020202020202020202020202020202020202020202034396236")
    }
}
