import CryptoKit
import Foundation

extension String {
var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}

let prefix = "yzbqklnj"
var iterator = 1

while !"\(prefix)\(iterator)".MD5.starts(with: "00000") {
    iterator += 1
}

print(iterator)

while !"\(prefix)\(iterator)".MD5.starts(with: "000000") {
    iterator += 1
}

print(iterator)
