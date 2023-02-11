//
//  YAPService.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 17/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import StoreKit
import CryptoSwift
//import Networking

public enum Y0d6UBhextw1OZQFlK0djSkam1Xh8AO5 {
    case tPBnDowCXqnziBK1haQfCn3YpuoqnlvY
    case u2Jn87KYVOFvDejmKi9GDGMmI5v0joHR
}

public protocol bE6wkfYZ8rrEb9OG19MTGaZXg8OUjpRg {

    var BTUMEHQ2k275o3VT9majn37Rqo6GnmTz: [tDPozLY4vyhEdm2D4NHEcLtPeBu3wPgS]? { get }

    func l2VKiidWVDo4vSRV7hKEr13cb0W4sawd(ids: Array<String>, completion:@escaping (Array<SKProduct>?, Error?) -> Void)
    func ZfAlR2OAMryd0RXkzooYCr6a05drqL5p(productId: String, completion: @escaping (SKError?) -> Void)
    func s56lOh9ySWqZc46SqH7mASZ0FZkBOzLu()

}

extension bE6wkfYZ8rrEb9OG19MTGaZXg8OUjpRg {

    private func KyAzwBUGQUSbX74SsqPcD5FIGdkNRNZv(forAstersArray astersArray: [Int]) -> [UInt8]? {
        let key = String("\([18, 34, 17, 69, 122, 28, 80, 50, 5, 83, 37, 7, 93, 71, 96, 20, 106].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG.crc32())\([0, 55, 2, 30, 39, 29, 50, 62, 66, 2, 1, 93, 22, 24, 56, 5].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG.FZPgzRSGmAMSXHlYKECldaoSwLiT39hM)\([28, 42, 67, 5, 38, 20, 3, 34, 85, 88, 40, 6, 7, 7, 54, 66, 110, 105, 2, 49, 120].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG.reversed())").crc32()
        let astearsArrayString = astersArray.compactMap({ String($0) }).joined(separator: "_")
        let astersSignature = try? HMAC(key: key, variant: .sha2(.sha256)).authenticate(astearsArrayString.OzyVUNvmc4TLU8GfaxCwuc5TctC14y46)
        return astersSignature
    }

}

extension bE6wkfYZ8rrEb9OG19MTGaZXg8OUjpRg {

    var SL4yFx7RMGc2w74dDHOlwvWN3xSAJokO: String? {
        if #available(iOS 13.0, *) {
            return SKPaymentQueue.default().storefront?.countryCode
        } else {
            return nil
        }
    }

    private var sY5md4yqp1kulKje1Vv9Rg3l9LNVS1yS: GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z> {
        GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z>(engine: .customSession)
    }

    public func BBdNfX1VpgHDNlhLfb5OsFsT7xly4Fha(overridenUsername: String? = nil, completion: ((Bool) -> Void)? = nil) {
        if let appStoreReceiptURL = Bundle.main.appStoreReceiptURL,
           FileManager.default.fileExists(atPath: appStoreReceiptURL.path) {

            do {
                let receiptData = try Data(contentsOf: appStoreReceiptURL, options: .alwaysMapped)
                let receipt = H2ikYdKdFqK4mukqUcclCD84oNKVvbgg(resiptDataString: receiptData.base64EncodedString())

                var username: String {
                    if let overridenUsername = overridenUsername {
                        return overridenUsername
                    } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL == [].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG {
                        return [11, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
                    } else {
                        return OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL
                    }
                }

                var id: String {
                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa == [].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG {
                        return [11, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
                    } else {
                        return OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa
                    }
                }

                let endpoint: RBiSyKE4En773hSSDHFoN2lHb37cDW0Z.hYmZpR6Nyt5JWpPQMsJULAU2odSRpC1h = .BBdNfX1VpgHDNlhLfb5OsFsT7xly4Fha(panPotID: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa, panPotUserName: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, country: SL4yFx7RMGc2w74dDHOlwvWN3xSAJokO ?? [11, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)

                var routerEndpoint = RBiSyKE4En773hSSDHFoN2lHb37cDW0Z(SAuL4WFDmxOLz6dtnXaIO9YYx3yhFuMq: endpoint)
                routerEndpoint.WijWIVRw1wa2lfKi4voAIXRVZd1I68eS(receipt)

                sY5md4yqp1kulKje1Vv9Rg3l9LNVS1yS.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<VusAMWNJPBcmQ4NRJ6NMQAgobxVk48cD, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            completion?(response.status == [28, 40].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "ok"
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

