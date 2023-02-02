//
//  HTTPRouter.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation
import DeviceTools
import Networking

// MARK: - Endpoint routing

struct MorrisRouter: HTTPEndpoint {

    // MARK: - Cases
    enum EndPoint {
        case submitFollowerOrder
        case submitLikeOrder
        case getUserPosts
        case getUserInfo
        case getVideoInfo
        case orderStatus(panPotID: String)
        case settings
        case existingUserCheck(panPotID: String)
        case privacySettings
        case verifyReceipt(panPotID: String, panPotUserName: String, country: String)
        case checkAgapeTTAPI(panPotID: String, secUID: String)
    }

    var endpoint: EndPoint
    
    // MARK: - URL building properties

    var rawFormData: Data?

    public var baseURL: URL {
        switch endpoint {
        case .settings:
            return Tocal.configuration.s3URL
        case .existingUserCheck, .submitFollowerOrder, .submitLikeOrder, .getUserPosts, .getUserInfo, .getVideoInfo, .orderStatus:
            return Tocal.configuration.apiURL
        case .privacySettings, .verifyReceipt:
            return Tocal.configuration.logURL
        case .checkAgapeTTAPI:
            return URL(string: "https://m.tiktok.com")!
        }
    }

    public var path: String {
        switch endpoint {
        case .settings: return String(format: [92, 33, 28, 24, 43, 95, 1].localizedString, Tocal.configuration.version) // ""/blob%d", %d = app version
        case .submitFollowerOrder, .submitLikeOrder: return "/api/v1/order"
        case .getUserPosts: return "/api/v1/posts"
        case .getUserInfo: return "/api/v1/user"
        case .getVideoInfo: return "/api/v1/video"
        case .orderStatus: return "/api/v1/status"
        case .existingUserCheck: return [92, 38, 8, 7, 44, 8, 12, 58, 83, 4, 51].localizedString // "/experiment"
        case .privacySettings: return String(format: [92, 34, 0, 7, 102, 12, 64, 23, 25, 11, 35, 65].localizedString, String(String(Tocal.configuration.version).dropFirst())) // "/app/v%@/ads"
        case .verifyReceipt: return [92, 42, 17, 7, 102, 12, 0, 37, 95, 12, 62, 109, 22, 16, 58, 20, 51, 43, 31].localizedString // "/iap/verify_receipt"
        case .checkAgapeTTAPI: return "/api/item_list"
        }
    }

    public var method: HTTPMethod {
        switch endpoint {
        case .getUserPosts, .getVideoInfo, .getUserInfo, .submitLikeOrder, .submitFollowerOrder, .verifyReceipt: return .post
        default: return .get
        }
    }

    public var contentType: HTTPContentType {
        .json
    }

    // MARK: - Dictionaries

    public var headers: HTTPHeaders? {
        nil
    }

    public var queryParameters: HTTPParameters? {
        var internal_parameters = [[26, 42, 20].localizedString: ALUserInfoService.internalID] // "iid"
        switch endpoint {
        case .orderStatus(let id):
            internal_parameters["target"] = id
        case .existingUserCheck(let panPotID)://, .showFeed(let panPotID):
            internal_parameters[[29, 42, 20].localizedString] = panPotID // "nid"
        case .verifyReceipt(let panPotID, let panPotUserName, let country):
            internal_parameters[[6, 48, 21, 5, 32, 30].localizedString] = panPotID // "userid"
            internal_parameters[[6, 48, 21, 5, 39, 27, 8, 50].localizedString] = panPotUserName // "username"
            internal_parameters[[16, 44, 5, 25, 61, 8, 28].localizedString] = country // "country"
        case .checkAgapeTTAPI(let panPotID, let secUID):
            let parameters: HTTPHeaders = [
                "aid": 1988,
                "id": panPotID,
                "secUid": secUID,
                "count": 1,
                "maxCursor": 0,
                "minCursor": 0,
                "sourceType": 8
            ]
            return parameters
        default:
            return internal_parameters
        }
        return internal_parameters
    }

    public var parameters: HTTPParameters? {
        nil
    }
    
    var bodyQueryParameters: HTTPParameters? {
        nil
    }
    
    var cookies: [HTTPCookie]? {
        nil
    }

}

// MARK: - Authentication

extension MorrisRouter: Authenticatable {

    // Returns true for the cases that need authentication.
    var needsAuthentication: Bool {
        return false
    }
}


