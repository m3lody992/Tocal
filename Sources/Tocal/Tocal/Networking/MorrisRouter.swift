//
//  HTTPRouter.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//
import Foundation
//import DeviceTools
//import Networking

// MARK: - Endpoint routing
struct MorrisRouter: S68IzldiTLt1jnUpi2P6XineLZbfhiPI {

    // MARK: - Cases
    enum hYmZpR6Nyt5JWpPQMsJULAU2odSRpC1h {
        case submitFollowerOrder
        case submitLikeOrder
        case getUserPosts
        case getUserInfo
        case getVideoInfo
        case orderStatus(panPotUsername: String)
        case settings
        case existingUserCheck(panPotID: String)
        case privacySettings
        case verifyReceipt(panPotID: String, panPotUserName: String, country: String)
    }

    var endpoint: hYmZpR6Nyt5JWpPQMsJULAU2odSRpC1h

    // MARK: - URL building properties
    var y2FflgtKrrWR6QMloqg5Pe69hIrgpsH8: Data?

    public var R8r0pjGlMK6ftNBnM6ElIacCJ0GIffSd: URL {
        switch endpoint {
        case .settings:
            return pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.s3URL
        case .existingUserCheck, .submitFollowerOrder, .submitLikeOrder, .getUserPosts, .getUserInfo, .getVideoInfo, .orderStatus:
            return pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.q9awJ7b7fK3DYhM0dG477TqMF71FqEX4
        case .privacySettings, .verifyReceipt:
            return pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.x82MzAjZzxmvnrctzrmwSfIqKSEAnbmA
        }
    }

    public var k9xAla0pwAG5943OD4QLHTPSjrnsfODl: String {
        switch endpoint {
        case .settings: return String(format: [92, 33, 28, 24, 43, 95, 1].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.zSE2PyDYOwEeCiOw2y6Xapvt2UCVbT91) // ""/blob%d", %d = app version
        case .submitFollowerOrder, .submitLikeOrder: return "/api/v1/order"
        case .getUserPosts: return "/api/v1/posts"
        case .getUserInfo: return "/api/v1/user"
        case .getVideoInfo: return "/api/v1/video"
        case .orderStatus: return "/api/v1/status"
        case .existingUserCheck: return [92, 38, 8, 7, 44, 8, 12, 58, 83, 4, 51].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "/experiment"
        case .privacySettings: return String(format: [92, 34, 0, 7, 102, 12, 64, 23, 25, 11, 35, 65].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, String(String(pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.zSE2PyDYOwEeCiOw2y6Xapvt2UCVbT91).dropFirst())) // "/app/v%@/ads"
        case .verifyReceipt: return [92, 42, 17, 7, 102, 12, 0, 37, 95, 12, 62, 109, 22, 16, 58, 20, 51, 43, 31].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "/iap/verify_receipt"
        }
    }

    public var yEBNWFJeSwTv53Qq9jXmEdLTcoNwVX5V: EgErsH45itOl4vAhnFPNNrMAfpcLj41b {
        switch endpoint {
        case .getUserPosts, .getVideoInfo, .getUserInfo, .submitLikeOrder, .submitFollowerOrder, .verifyReceipt: return .cNFiaAqn3kiQ4zzydjZH8qZpnX9ISBKh
        default: return .sjbpNzX4u5ZR98s2qTI0lCFGyOMfz1xJ
        }
    }

    public var aNFemhPMC29I1LR2wE4QgYlyT5Dwf91k: itfjcGc3VwAjRk6PMelCnLx1g3Z12Ive {
        .m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP
    }

    // MARK: - Dictionaries
    public var PhbOepncKEolQepHqxA53b1ZoXIXs2DS: HTTPHeaders? {
        nil
    }

    public var sU8wgXTIPd3t8flaxUjXJo3FRJmMP1Qu: HTTPParameters? {
        var parameters = [[26, 42, 20].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.tN03UaWnBTTyOpxwoH8AAjZUAYL6h0Zq] // "iid"
        switch endpoint {
        case .orderStatus(let username):
            parameters["username"] = username
        case .existingUserCheck(let panPotID)://, .showFeed(let panPotID):
            parameters[[29, 42, 20].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG] = panPotID // "nid"
        case .verifyReceipt(let panPotID, let panPotUserName, let country):
            parameters[[6, 48, 21, 5, 32, 30].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG] = panPotID // "userid"
            parameters[[6, 48, 21, 5, 39, 27, 8, 50].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG] = panPotUserName // "username"
            parameters[[16, 44, 5, 25, 61, 8, 28].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG] = country // "country"
        default:
            return parameters
        }
        return parameters
    }

    public var ykS3ixZNYbiPLz0FLHqW7u3bBySdDv0K: HTTPParameters? {
        nil
    }

    var SNP3q2cNAQJvkVVw3AKHNxGafn4ZTJjc: HTTPParameters? {
        nil
    }

    var nMgm4tQFBVlsdDyjyNqBbmFFJbWjGOJW: [HTTPCookie]? {
        nil
    }

}

// MARK: - Authentication
extension MorrisRouter: ZwGpmcLQvhAsBXqgLY8xj7xbHcyCTVp7 {

    // Returns true for the cases that need authentication.
    var aBT6kz0KueVAbNUyXVWnKc6BNoDhfoR2: Bool {
        return false
    }
}
