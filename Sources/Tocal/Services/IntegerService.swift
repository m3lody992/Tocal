//
//  IntegerService.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/03/2021.
//  Copyright © 2021 Eric Cartmenez. All rights reserved.
//

import CryptoSwift
import Foundation

struct IntegerService {

    static func decrypt(cryptedMessage: String) -> [UInt8]? {
        guard let cryptedData = Data(base64Encoded: cryptedMessage)  else {
            return nil
        }

        do {
            let aes = try AES(
                key: Array<UInt8>.init(hex: [49, 6, 68, 52, 127, 56, 32, 96, 117, 88, 117, 1, 80, 64, 109, 70, 107, 108, 93, 116, 117, 117, 87, 98, 7, 27, 109, 23, 114, 18, 23, 53].localizedString), // "BE4C6BE7C2234547176795324CCE71EF"
                blockMode: CBC(iv: Array<UInt8>.init(hex: [70, 116, 51, 68, 120, 56, 86, 101, 6, 43, 114, 4, 82, 69, 96, 64, 25, 29, 89, 7, 123, 6, 32, 97, 114, 106, 27, 23, 124, 19, 102, 70].localizedString)), // "57C31B320A566091CF2D7FD1A25E9045"
                padding: .pkcs5) // aes128
            return try aes.decrypt(cryptedData.bytes)
        } catch {
            return nil
        }
    }

}
