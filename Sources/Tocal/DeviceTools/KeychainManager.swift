//
//  Keychain
//
//  Created by Eric Cartmenez on 06/12/2021.
//  Copyright © 2021 Eric Cartmenez. All rights reserved.
//

import Foundation
import KeychainAccess

// Used becasue encoding primitives on <iOS13 results in an error.
public struct WcxeW74joErwqLJeGjxQj84rNXwPeBfQ<T: Codable>: Codable {
    public let value: T
}

public struct p38tislEkDmfaM5Trf2CDA3uaTpqRNLe {

    private static let USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo = p38tislEkDmfaM5Trf2CDA3uaTpqRNLe()
    private let YgCor1jcL7iYASZibxiVnMWsaxyQxGQs = Keychain(service: dfnLsTm7Oq87MwAsQWV2jLMYhNqlhTuj.to18NPrcGuVPyJDfwah5TM4jP0qXUg0R + "Keychain") // "Keychain" 

    public static func GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp<T: Codable>(for key: String) -> T? {
		let name = key

		switch T.self {
        case is String.Type:
            return USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[string: name] as? T
		case is Data.Type:
			return USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[data: name] as? T
		case is UUID.Type:
			guard let uuidString = USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[string: name]
			else {
				return nil
			}

			return UUID(uuidString: uuidString) as? T
		default:
			guard let data = USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[data: name]
			else {
				return nil
			}

			do {
				return try JSONDecoder().decode(WcxeW74joErwqLJeGjxQj84rNXwPeBfQ<T>.self, from: data).value
			}
			catch {
				print("\(String(describing: T.self)) \(error)")
			}
		}

		return nil
	}

    public static func XEaHoJcMOewthI8CUuDkUl3FbYB7jIna<T: Codable>(value: T, for key: String) {
		if let value = value as? Data {
            USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[data: key] = value
		}
		else if let value = value as? String {
			USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[string: key] = value
		}
		else if let value = value as? UUID {
			USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[string: key] = value.uuidString
		}
		else {
			do {
				let data = try JSONEncoder().encode(WcxeW74joErwqLJeGjxQj84rNXwPeBfQ(value: value))
				USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[data: key] = data
			}
			catch {
				print("\(String(describing: type(of: value))) \(error)")
			}
		}
	}

    public static func e6UqkpKMrMvtzmPtB9eCDEKHiOIQqcSg(key: String) {
		USFMfPHJZxpC5sUkNFVU5m7uqpiCayMo.YgCor1jcL7iYASZibxiVnMWsaxyQxGQs[key] = nil
	}

}

