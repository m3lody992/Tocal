//
//  YAPService.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 17/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import StoreKit
import CryptoSwift
import Networking

public enum YapType {
    case yap
    case sub
}

public protocol YAPService {

    var yapIDs: [YapProduct]? { get }

    func load(ids: Array<String>, completion:@escaping (Array<SKProduct>?, Error?) -> Void)
    func purchaseProduct(productId: String, completion: @escaping (SKError?) -> Void)
    func requestReview()

}

extension YAPService {

    private func getSignature(forAstersArray astersArray: [Int]) -> [UInt8]? {
        let key = String("\([18, 34, 17, 69, 122, 28, 80, 50, 5, 83, 37, 7, 93, 71, 96, 20, 106].localizedString.crc32())\([0, 55, 2, 30, 39, 29, 50, 62, 66, 2, 1, 93, 22, 24, 56, 5].localizedString.asHexString)\([28, 42, 67, 5, 38, 20, 3, 34, 85, 88, 40, 6, 7, 7, 54, 66, 110, 105, 2, 49, 120].localizedString.reversed())").crc32c()
        let astearsArrayString = astersArray.compactMap({ String($0) }).joined(separator: "_")
        let astersSignature = try? HMAC(key: key, variant: .sha2(.sha256)).authenticate(astearsArrayString.asUInt8Array)
        return astersSignature
    }

}

extension YAPService {

    var locale: String? {
        if #available(iOS 13.0, *) {
            return SKPaymentQueue.default().storefront?.countryCode
        } else {
            return nil
        }
    }

    private var http: HTTPJSONClient<HTTPRouter> {
        HTTPJSONClient<HTTPRouter>()
    }

    public func verifyReceipt(overridenUsername: String? = nil, completion: ((Bool) -> Void)? = nil) {
        if let appStoreReceiptURL = Bundle.main.appStoreReceiptURL,
           FileManager.default.fileExists(atPath: appStoreReceiptURL.path) {

            do {
                let receiptData = try Data(contentsOf: appStoreReceiptURL, options: .alwaysMapped)
                let receipt = Resipt(resiptDataString: receiptData.base64EncodedString())

                var username: String {
                    if let overridenUsername = overridenUsername {
                        return overridenUsername
                    } else if ALUserInfoService.panPotUserName == [].localizedString {
                        return [11, 59].localizedString
                    } else {
                        return ALUserInfoService.panPotUserName
                    }
                }

                var id: String {
                    if ALUserInfoService.panPotID == [].localizedString {
                        return [11, 59].localizedString
                    } else {
                        return ALUserInfoService.panPotID
                    }
                }

                let endpoint: HTTPRouter.EndPoint = .verifyReceipt(panPotID: ALUserInfoService.panPotID, panPotUserName: ALUserInfoService.panPotUserName, country: locale ?? [11, 59].localizedString)

                var routerEndpoint = HTTPRouter(endpoint: endpoint)
                routerEndpoint.encodeModelToData(receipt)

                http.json(routerEndpoint) { (result: Result<NetworkResponse, NetworkingError>) in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            completion?(response.status == [28, 40].localizedString) // "ok"
                        }
                    case .failure:
                        break // Do nothing for now
                    }
                }
            } catch {
                // Do nothing for now
            }
        }
    }
}

