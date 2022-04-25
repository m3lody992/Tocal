//
//  String.swift
//  SwipeableTabBarController
//
//  Created by Eric Cartmenez on 23/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

extension Character {

    var utf8: UInt8 {
        let utf8 = String(self).utf8
        return utf8[utf8.startIndex]
    }

}

extension String {

    var asHexString: String {
        Data(self.utf8).map{ String(format:"%02x", $0) }.joined()
    }

    var asUInt8Array: [UInt8] {
        Array(utf8)
    }

    func stringByXOREncoding(withCipher cipher: String) -> String? {
        let key = cipher.map { $0 }
        let length = key.count
        var output = [].localizedString

        for i in self.enumerated() {
            guard let byteString = String(bytes: [i.element.utf8 ^ key[i.offset % length].utf8],
                                          encoding: .utf8) else {
                return nil
            }
            output.append(byteString)
        }

        return output
    }

    func stringByXORDecoding(fromCipher cipher: String) -> String? {
        stringByXOREncoding(withCipher: cipher)
    }

}

extension Array where Element == UInt8 {

    public var localizedString: String {
        let cipher: [UInt8] = [115, 67, 112, 119, 73, 122, 101, 87, 54, 106, 71, 50, 100, 117, 89, 113, 90, 91, 107, 67, 76, 64, 100, 80, 51, 88, 46, 82, 69, 35, 82]
        let length = cipher.count

        var decrypted = [UInt8]()

        for k in enumerated() {
            decrypted.append(k.element ^ cipher[k.offset % length])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }

}
