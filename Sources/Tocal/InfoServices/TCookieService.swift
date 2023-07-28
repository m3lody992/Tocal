//
//  File.swift
//  
//
//  Created by Eric Cartmenez on 21/04/2022.
//

import WebKit

public extension WKWebView {

    func XHJUpF5M08I5Rnp0GLYcNd311c8eey2E(for domainName: String, completion: (() -> Void)? = nil) { // "tiktok"
        DispatchQueue.main.async {
            oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw.IbuKM6nhymf2UDUX0YojRjOkA6wSlOBa(for: domainName) { _ in
                for cookie in oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw.nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW {
                    self.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                }
                completion?()
            }
        }
    }

    func gJddBzx3ICvSYc45jVkbJbbgVj3V3wln() {
        DispatchQueue.main.async {
            for cookie in oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw.nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW {
                self.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
            }
        }
    }

    func qIgxHd0fziXmTqYPDM7rTWz0WCwiYoWR(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let cookieStore = self.configuration.websiteDataStore.httpCookieStore
            let dispatchGroup = DispatchGroup()
            cookieStore.getAllCookies { cookies in
                for cookie in cookies {
                    dispatchGroup.enter()
                    cookieStore.delete(cookie) {
                        dispatchGroup.leave()
                    }
                }
            }
            dispatchGroup.notify(queue: .main) {
                self.configuration.processPool = WKProcessPool()
                completion?()
            }
        }
    }

}

public struct hrrXtz2N6ZR89Dlp2FAfALuxviTw0wqK: Codable, Equatable, Hashable {

    public var domain: String
    public var path: String
    public var name: String
    public var value: String
    public var isSecure: Bool
    public var expiresDate: Date?

    public init(cookie: HTTPCookie) {
        domain = cookie.domain
        path = cookie.path
        name = cookie.name
        value = cookie.value
        isSecure = cookie.isSecure
        expiresDate = cookie.expiresDate
    }

    public var asHTTPCookie: HTTPCookie? {
        HTTPCookie(properties: [
            .domain: domain,
            .path: path,
            .name: name,
            .value: value,
            .secure: isSecure,
            .expires: expiresDate
        ])
    }
}

public struct oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw {
    
    public static var nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW: [HTTPCookie] {
        get { (X1iKHs7rdmLUsYHlkc2A1KotUwjWuaoU.e2xPS6qKVXGHDQ7ytk6ZaFDdEEV4zoE8.Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX(forKey: X1iKHs7rdmLUsYHlkc2A1KotUwjWuaoU.YmZjHBIHCHEWlbl6KnMBXjmTVNfQjrg8.gDMge9X9rCUkPiXmImS55ciVY0rf4AFg) ?? [hrrXtz2N6ZR89Dlp2FAfALuxviTw0wqK]()).compactMap { $0.asHTTPCookie } }
        set { X1iKHs7rdmLUsYHlkc2A1KotUwjWuaoU.e2xPS6qKVXGHDQ7ytk6ZaFDdEEV4zoE8.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(newValue.compactMap { hrrXtz2N6ZR89Dlp2FAfALuxviTw0wqK(cookie: $0) }, forKey: X1iKHs7rdmLUsYHlkc2A1KotUwjWuaoU.YmZjHBIHCHEWlbl6KnMBXjmTVNfQjrg8.gDMge9X9rCUkPiXmImS55ciVY0rf4AFg) }
    }

    public static func eXViaedxUQjetsYtR5GsOQyHpzkRvXiO(withCookies freshCookies: [HTTPCookie]) {
        // We add missing cookies
        let tempFreshCookies = freshCookies.compactMap({ hrrXtz2N6ZR89Dlp2FAfALuxviTw0wqK(cookie: $0)})
        let tempExistingCookies = nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW.compactMap({ hrrXtz2N6ZR89Dlp2FAfALuxviTw0wqK(cookie: $0)})
        var mutableCookies = Array(Set(tempFreshCookies + tempExistingCookies)).compactMap({ $0.asHTTPCookie })

        // Iterate through the array and update cookies with new ones.
        for (index, cookie) in mutableCookies.enumerated() {
            if let freshCookie = freshCookies.first(where: { $0.name == cookie.name && ($0.expiresDate ?? Date() >= cookie.expiresDate ?? Date() || $0.version >= cookie.version) }) {
                mutableCookies[index] = freshCookie
            }
        }
        nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW = Array(Set(mutableCookies))
    }

    public static func BORTovMuBeQ8iEXBx3mGudcqMA4PiJn8(for domain: String) -> Bool { // "tiktok"
        guard let mainCookie = nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW.first(where: { $0.name == X1iKHs7rdmLUsYHlkc2A1KotUwjWuaoU.pQt0JLxQCyIEJF1Lam8MA6kHkCy2LQWu && $0.domain.contains(domain) }),
              let mainCookieExpiresDate = mainCookie.expiresDate else {
            return true
        }
        return Date() > mainCookieExpiresDate
    }

    public static func IbuKM6nhymf2UDUX0YojRjOkA6wSlOBa(for domain: String?, completion: (([HTTPCookie]) -> Void)? = nil) { // "tiktok"
        DispatchQueue.main.async {
            HZwP2p9hpbPZegRKRLqRPpr7DsOGXoMx(for: domain) { fetchedCookies in
                eXViaedxUQjetsYtR5GsOQyHpzkRvXiO(withCookies: fetchedCookies)
                completion?(nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW)
            }
        }
    }

    public static func HZwP2p9hpbPZegRKRLqRPpr7DsOGXoMx(for domain: String?, completion: @escaping ([HTTPCookie]) -> ()) { // "tiktok"
        var myCookies = [HTTPCookie]()
        DispatchQueue.main.async {
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
    }

    public static func ShBnpABOK5vSlIrIphGnZoZBbRXxrulE(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW.removeAll()
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
                WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: records) {
                    completion?()
                }
            }
        }
    }

}
