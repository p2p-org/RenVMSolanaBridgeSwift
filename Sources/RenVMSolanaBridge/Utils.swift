//
//  File.swift
//  
//
//  Created by Chung Tran on 09/09/2021.
//

import Foundation

struct Utils {
    static func generateNonce(sessionDay: Long) -> String {
        let string = String(repeating: " ", count: 28) + sessionDay.hexString
        let data = string.getBytes() ?? Data()
        return data.hexString
    }
}

extension Date {
    var millisecondsSince1970: Long {
        return Long((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }
    
    init(milliseconds: Long) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

extension Long {
    var hexString: String {
        String(self, radix: 16, uppercase: false)
    }
}

extension String {
    func getBytes() -> Data? {
        data(using: .utf8)
    }
}

extension Data {
    var hexString: String {
        map{ String(format:"%02x", $0) }.joined()
    }
}
