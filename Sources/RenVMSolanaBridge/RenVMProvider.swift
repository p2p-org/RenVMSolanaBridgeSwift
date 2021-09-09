import Foundation

public struct RenVMProvider {
    private let client: RpcClientType
    private var emptyParams = [String: String]()
    
    public init(client: RpcClientType) {
        self.client = client
    }
    
    public func queryMint(
        txHash: String,
        completion: @escaping RpcClientCompletion<ResponseQueryTxMint>
    ) {
        client.call(endpoint: "ren_queryTx", params: ["txHash": txHash], decodedTo: ResponseQueryTxMint.self, completion: completion)
    }
    
    public func queryBlockState(
        completion: @escaping RpcClientCompletion<ResponseQueryBlockState>
    ) {
        client.call(endpoint: "ren_queryBlockState", params: emptyParams, decodedTo: ResponseQueryBlockState.self, completion: completion)
    }

    public func queryConfig(
        completion: @escaping RpcClientCompletion<ResponseQueryConfig>
    ) {
        client.call(endpoint: "ren_queryConfig", params: emptyParams, decodedTo: ResponseQueryConfig.self, completion: completion)
    }

    public func submitTxMint(
        hash: String,
        input: MintTransactionInput,
        completion: @escaping RpcClientCompletion<ResponseSubmitTxMint>
    ) {
        client.call(endpoint: "ren_submitTx", params: ParamsSubmitMint(hash: hash, input: input), decodedTo: ResponseSubmitTxMint.self, completion: completion)
    }

//    public byte[] selectPublicKey() throws RpcException {
//        String pubKey = queryBlockState().getPubKey()
//        return Base64.getDecoder().decode(pubKey)
//    }

//    public String submitMInt(byte[] gHash, byte[] gPubKey, byte[] nHash, byte[] nonce, String amount, byte[] pHash,
//            String to, String txIndex, byte[] txid) throws RpcException {
//        MIntTransactionInput mIntTx = buildTransaction(gHash, gPubKey, nHash, nonce, amount, pHash, to, txIndex, txid)
//        String hash = Utils.toURLBase64(hashTransactionMInt(mIntTx))
//
//        submitTxMInt(hash, mIntTx)
//
//        return hash
//    }

//    public String mIntTxHash(byte[] gHash, byte[] gPubKey, byte[] nHash, byte[] nonce, String amount, byte[] pHash,
//            String to, String txIndex, byte[] txid) {
//        MIntTransactionInput mIntTx = buildTransaction(gHash, gPubKey, nHash, nonce, amount, pHash, to, txIndex, txid)
//        return Utils.toURLBase64(hashTransactionMInt(mIntTx))
//    }

//    public static MIntTransactionInput buildTransaction(byte[] gHash, byte[] gPubKey, byte[] nHash, byte[] nonce,
//            String amount, byte[] pHash, String to, String txIndex, byte[] txid) {
//        MIntTransactionInput mIntTx = MIntTransactionInput()
//        mIntTx.txid = Utils.toURLBase64(txid)
//        mIntTx.txindex = txIndex
//        mIntTx.ghash = Utils.toURLBase64(gHash)
//        mIntTx.gpubkey = Utils.toURLBase64(gPubKey)
//        mIntTx.nhash = Utils.toURLBase64(nHash)
//        mIntTx.nonce = Utils.toURLBase64(nonce)
//        mIntTx.phash = Utils.toURLBase64(pHash)
//        mIntTx.to = to
//        mIntTx.amount = amount
//        return mIntTx
//    }

    // txHash
//    public static byte[] hashTransactionMInt(MIntTransactionInput mIntTx) {
//        ByteArrayOutputStream out = ByteArrayOutputStream()
//
//        String version = "1"
//        String selector = "BTC/toSolana"
//        out.writeBytes(marshalString(version))
//        out.writeBytes(marshalString(selector))
//
//        // marshalledType MIntTransactionInput
//        out.writeBytes(Base58.decode(
//                "aHQBEVgedhqiYDUtzYKdu1Qg1fc781PEV4D1gLsuzfpHNwH8yK2A2BuZK4uZoMC6pp8o7GWQxmsp52gsDrfbipkyeQZnXigCmscJY4aJDxF9tT8DQP3XRa1cBzQL8S8PTzi9nPnBkAxBhtNv6q1"))
//
//        out.writeBytes(marshalBytes(Utils.fromURLBase64(mIntTx.txid)))
//        out.writeBytes(ByteUtils.uInt32ToByteArrayBE(Long.valueOf(mIntTx.txindex)))
//        out.writeBytes(Utils.amountToUInt256ByteArrayBE(mIntTx.amount))
//        out.writeBytes(byte[] { 0, 0, 0, 0 })
//        out.writeBytes(Utils.fromURLBase64(mIntTx.phash))
//        out.writeBytes(marshalString(mIntTx.to))
//        out.writeBytes(Utils.fromURLBase64(mIntTx.nonce))
//        out.writeBytes(Utils.fromURLBase64(mIntTx.nhash))
//        out.writeBytes(marshalBytes(Utils.fromURLBase64(mIntTx.gpubkey)))
//        out.writeBytes(Utils.fromURLBase64(mIntTx.ghash))
//
//        return Hash.sha256(out.toByteArray())
//    }

//    static byte[] marshalString(String src) {
//        return marshalBytes(src.getBytes())
//    }

//    static byte[] marshalBytes(byte[] in) {
//        byte[] out = byte[ByteUtils.UInt_32_LENGTH + in.length]
//        System.arraycopy(ByteUtils.uInt32ToByteArrayBE(in.length), 0, out, 0, ByteUtils.UInt_32_LENGTH)
//        System.arraycopy(in, 0, out, ByteUtils.UInt_32_LENGTH, in.length)
//        return out
//    }

}

public struct ResponseQueryTxMint: Decodable {
    
}

public struct ResponseQueryBlockState: Decodable {
    
}

public struct ResponseQueryConfig: Decodable {
    
}

public struct ResponseSubmitTxMint: Decodable {
    
}

public struct ParamsSubmitMint: Encodable {
    let hash: String
    let input: MintTransactionInput
}
public struct MintTransactionInput: Encodable {
    
}
