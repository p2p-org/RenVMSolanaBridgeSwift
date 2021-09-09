//
//  File.swift
//  
//
//  Created by Chung Tran on 09/09/2021.
//

import Foundation

public typealias RpcClientCompletion<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol RpcClientType {
    init(_ network: Network)
    func call<T: Decodable>(endpoint: String, params: Encodable, decodedTo: T.Type, completion: @escaping RpcClientCompletion<T>)
}
