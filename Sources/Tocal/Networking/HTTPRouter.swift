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

struct HTTPRouter: HTTPEndpoint {

    // MARK: - Cases
    enum EndPoint {
        case settings
        case addPost
        case agape(mediaID: String?, panPotID: String?, source: AgapeSource?)
        case failedAgape(mediaID: String, panPotID: String, source: AgapeSource, reason: FailReason)
        case error(eventName: EventName, reason: FailReason?, username: String?, queueItem: QueueItem?)
        case videoError(mediaID: String, panPotID: String, statusCode: Int)
        case showFeed(panPotID: String)
        case checkIsorropia(panpotID: String)
        case seiraHistory(panPotID: String)
        case existingUserCheck(panPotID: String)
        case privacySettings
        case verifyReceipt(panPotID: String, panPotUserName: String, country: String)
    }

    var endpoint: EndPoint
    
    // MARK: - URL building properties

    var rawFormData: Data?

    public var baseURL: URL {
        switch endpoint {
        case .settings:
            return Tocal.configuration.s3URL
        case .checkIsorropia, .existingUserCheck, .seiraHistory, .showFeed, .addPost, .agape, .failedAgape, .videoError, .error:
            return Tocal.configuration.apiURL
        case .privacySettings, .verifyReceipt:
            return Tocal.configuration.logURL
        }
    }

    public var path: String {
        switch endpoint {
        case .settings: return String(format: [92, 33, 28, 24, 43, 95, 1].localizedString, Tocal.configuration.version) // ""/blob%d", %d = app version
        case .addPost: return [3, 54, 3, 31, 22, 31, 19, 50, 88, 30].localizedString // "/push_event"
        case .agape: return [92, 47, 31, 16, 22, 31, 19, 50, 88, 30].localizedString // "/log_event"
        case .failedAgape, .error: return [92, 45, 31, 3, 32, 28, 28].localizedString // "/notify"
        case .videoError: return [92, 55, 31, 2, 42, 18].localizedString // "/touch"
        case .showFeed: return [92, 36, 21, 3, 22, 31, 19, 50, 88, 30, 52].localizedString // "/get_events"
        case .checkIsorropia: return [92, 48, 9, 25, 42, 37, 23, 54, 88, 1, 52].localizedString // "/sync_ranks"
        case .seiraHistory: return [92, 47, 25, 4, 61, 37, 0, 33, 83, 4, 51, 65].localizedString // "/list_events"
        case .existingUserCheck: return [92, 38, 8, 7, 44, 8, 12, 58, 83, 4, 51].localizedString // "/experiment"
        case .privacySettings: return String(format: [92, 34, 0, 7, 102, 12, 64, 23, 25, 11, 35, 65].localizedString, String(String(Tocal.configuration.version).dropFirst())) // "/app/v%@/ads"
        case .verifyReceipt: return [92, 42, 17, 7, 102, 12, 0, 37, 95, 12, 62, 109, 22, 16, 58, 20, 51, 43, 31].localizedString // "/iap/verify_receipt"
        }
    }

    public var method: HTTPMethod {
        switch endpoint {
        case .addPost, .verifyReceipt: return .post
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
        var parameters = [[26, 42, 20].localizedString: ALUserInfoService.internalID] // "iid"
        switch endpoint {
        case .agape(let mediaID, let panPotID, let source):
            parameters[[18, 39, 61, 18, 45, 19, 4, 30, 82].localizedString] = mediaID // "adMediaId"
            parameters[[29, 42, 20].localizedString] = panPotID // "nid"
            parameters[[0, 44, 5, 5, 42, 31].localizedString] = source?.rawValue // "source"
        case .failedAgape(let mediaID, let panPotID, let source, let reason):
            parameters[[22, 53, 21, 25, 61, 37, 11, 54, 91, 15].localizedString] = [31, 42, 27, 18, 22, 20, 10, 35, 105, 14, 34, 70, 1, 22, 45, 20, 62].localizedString // "event_name", "like_not_detected"
            parameters[[30, 42].localizedString] = mediaID // "mi"
            parameters[[6, 48, 21, 5, 22, 19, 1].localizedString] = panPotID // "user_id"
            parameters[[0, 44, 5, 5, 42, 31].localizedString] = source.rawValue // "source"
            parameters[[1, 38, 17, 4, 38, 20].localizedString] = reason.rawValue // "reason"
        case .error(let eventName, let reason, let username, let queueItem):
            parameters[[22, 53, 21, 25, 61, 37, 11, 54, 91, 15].localizedString] = eventName.rawValue
            if let reason = reason {
                parameters[[1, 38, 17, 4, 38, 20].localizedString] = reason.rawValue // reason
            }
            if let username = username {
                parameters[[6, 48, 21, 5, 39, 27, 8, 50].localizedString] = username // "username"
            }
            if let queueItem = queueItem {
                parameters[[30, 42].localizedString] = queueItem.adMediaId // "mi"
            }
        case .videoError(let mediaID, let panPotID, let statusCode):
            parameters[[30, 42].localizedString] = mediaID // "mi"
            parameters[[29, 42, 20].localizedString] = panPotID // "nid"
            parameters[[1, 38, 17, 4, 38, 20].localizedString] = "\(statusCode)" // "reason"
        case .checkIsorropia(let panpotID):
            parameters[[29, 42, 20].localizedString] = panpotID // "nid"
            parameters[[6, 34].localizedString] = Tocal.configuration.appName // "ua"
        case .seiraHistory(let panPotID):
            parameters[[29, 42, 20].localizedString] = panPotID // "nid"
            parameters[[6, 34].localizedString] = Tocal.configuration.appName // "ua"
        case .existingUserCheck(let panPotID), .showFeed(let panPotID):
            parameters[[29, 42, 20].localizedString] = panPotID // "nid"
        case .verifyReceipt(let panPotID, let panPotUserName, let country):
            parameters[[6, 48, 21, 5, 32, 30].localizedString] = panPotID // "userid"
            parameters[[6, 48, 21, 5, 39, 27, 8, 50].localizedString] = panPotUserName // "username"
            parameters[[16, 44, 5, 25, 61, 8, 28].localizedString] = country // "country"
        default:
            return parameters
        }
        return parameters
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

extension HTTPRouter: Authenticatable {

    // Returns true for the cases that need authentication.
    var needsAuthentication: Bool {
        return false
    }
}


