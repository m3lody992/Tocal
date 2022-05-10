//
//  SigningUtils.swift
//
//
//  Created by Eric Cartmenez on 25/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import CryptoSwift

public struct pjcFMK1YKRyQt9OORP1TPP6Zb9evzwOO {

    public static func aEY7XLDyQIe2MOKpZ95gVSZ5NCUiN4gb(_ message: String?) -> String {

        let ipadXORBytes = Data(base64Encoded: vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.ZoytBXwE4IUFzBcpcymexmmqciYMRSCH.Jguaf34Wv9m1ziMY1IxKXCVQSyf8DcZl)
        let opadXORBytes = Data(base64Encoded: vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.ZoytBXwE4IUFzBcpcymexmmqciYMRSCH.dOCoIFNMiiLatnJQtgi2etBg5oXHf1nq)

        let messageBytes = message?.data(using: .utf8)

        var firstInput = Data()
        var secondInput = Data()

        if let ipadXORBytes = ipadXORBytes {
            firstInput.append(ipadXORBytes)
        }

        if let messageBytes = messageBytes {
            firstInput.append(messageBytes)
        }

        let firstHash = firstInput.sha256()

        if let opadXORBytes = opadXORBytes {
            secondInput.append(opadXORBytes)
        }

        secondInput.append(firstHash)

        let secondHash = secondInput.sha256()

        return secondHash.toHexString()
    }

}
