import Foundation

public protocol PublicKeyType {
    init?(base64Encoded: String)
    var base58EncodedString: String {get}
}

public typealias Long = Int64
