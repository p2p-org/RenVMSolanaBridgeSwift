//
//  File.swift
//  
//
//  Created by Chung Tran on 09/09/2021.
//

import Foundation

struct RenVMError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    static var unknown: Self {
        .init("Unknown")
    }
}
