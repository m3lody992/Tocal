//
//  CookieService.swift
// 
//
//  Created by Eric Cartmenez on 02/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import WebKit
//import Networking

public extension Array where Element == HTTPCookie {
    
    var N744dG679h8ahPDv2Rh1TuQzmHmDgAGW: HTTPCookie? {
        first(where: { $0.name == vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.FI43T0D06DC4plbNfbaH4IXexiNmbtq1.JWJc7u8upNepEH72vKHw9CiCvbV0CDqt })
    }

    var OjuNGRSaSCJdYsoiiq1WQdoNVw1fVC7K: HTTPCookie? {
        first(where: { $0.name == vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.FI43T0D06DC4plbNfbaH4IXexiNmbtq1.ITCWPFSoftHUUkPAVoNx8qUxNiYT5eSv })
    }

    var nZFB9XbapFJ3OcA5fDfIkVDKtthxgqcY: HTTPCookie? {
        first(where: { $0.name == vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.FI43T0D06DC4plbNfbaH4IXexiNmbtq1.z8yTNh6J5l2srukVr83mYaZtTEXrreet })
    }
}

public struct k43fj6U8RVvHClqwLs1dLUIYTBIPLkPY {

    public static var nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW: [HTTPCookie] {
        get { (vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.e2xPS6qKVXGHDQ7ytk6ZaFDdEEV4zoE8.Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX(forKey: vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.YmZjHBIHCHEWlbl6KnMBXjmTVNfQjrg8.gDMge9X9rCUkPiXmImS55ciVY0rf4AFg) ?? [SAw6DJk7TVkHbSkPuKLgBt629V1YJzs7]()).compactMap { $0.asHTTPCookie } }
        set { vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.e2xPS6qKVXGHDQ7ytk6ZaFDdEEV4zoE8.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(newValue.compactMap { SAw6DJk7TVkHbSkPuKLgBt629V1YJzs7(cookie: $0) }, forKey: vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.YmZjHBIHCHEWlbl6KnMBXjmTVNfQjrg8.gDMge9X9rCUkPiXmImS55ciVY0rf4AFg) }
    }

    public static func eXViaedxUQjetsYtR5GsOQyHpzkRvXiO(withCookies freshCookies: [HTTPCookie]) {
        // We add missing cookies
        var mutableCookies = Array(Set(nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW + freshCookies))

        // Iterate through the array and update cookies with new ones.
        for (index, cookie) in mutableCookies.enumerated() {
            if let freshCookie = freshCookies.first(where: { $0.name == cookie.name && $0.expiresDate ?? Date() > cookie.expiresDate ?? Date() }) {
                mutableCookies[index] = freshCookie
            }
        }
        nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW = mutableCookies
    }

    public static func BORTovMuBeQ8iEXBx3mGudcqMA4PiJn8(for domain: String) -> Bool { // "instagram"
        guard let mainCookie = nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW.first(where: { $0.name == vkRAjDemnaFFjO0BHyr9rEKVsb2bjb8t.FI43T0D06DC4plbNfbaH4IXexiNmbtq1.JOEWKFppB0i0QOvz1LAi9K01XgoxpP48 && $0.domain.contains(domain) }),
              let mainCookieExpiresDate = mainCookie.expiresDate else {
            return true
        }
        return Date() > mainCookieExpiresDate
    }

    public static func IbuKM6nhymf2UDUX0YojRjOkA6wSlOBa(for domain: String?, completion: (([HTTPCookie]) -> Void)? = nil) { // "instagram"
        HZwP2p9hpbPZegRKRLqRPpr7DsOGXoMx(for: domain) { fetchedCookies in
            eXViaedxUQjetsYtR5GsOQyHpzkRvXiO(withCookies: fetchedCookies)
            completion?(fetchedCookies)
        }
    }

    public static func HZwP2p9hpbPZegRKRLqRPpr7DsOGXoMx(for domain: String?, completion: @escaping ([HTTPCookie]) -> ()) { // "instagram"
        var myCookies = [HTTPCookie]()
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                if let domain = domain {
                    if cookie.domain.contains(domain) {
                        myCookies.append(cookie)
                    }
                } else {
                    myCookies.append(cookie)
                }
            }
            completion(myCookies)
        }
    }

    public static func ShBnpABOK5vSlIrIphGnZoZBbRXxrulE(completion: (() -> Void)? = nil) {
        nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW.removeAll()
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
            completion?()
        }
    }

}
