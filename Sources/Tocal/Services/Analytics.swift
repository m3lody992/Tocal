//
//  Analytics.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 30/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
import Networking

struct Analytics {

    private static let http = HTTPJSONClient<HTTPRouter>()

    static func reportLoginError(reason: FailReason) {
        http.json(.init(endpoint: .error(eventName: .loginFailed, reason: reason, username: ALUserInfoService.panPotUserName, queueItem: nil))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportAddUserError(username: String, reason: FailReason) {
        http.json(.init(endpoint: .error(eventName: .addUserFailed, reason: reason, username: username, queueItem: nil))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportError(eventName: EventName, reason: FailReason) {
        http.json(.init(endpoint: .error(eventName: eventName, reason: reason, username: ALUserInfoService.panPotUserName, queueItem: nil))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportVideoLoadError(forQueueItem item: QueueItem, reason: FailReason) {
        http.json(.init(endpoint: .error(eventName: .videoLoadError, reason: reason, username: ALUserInfoService.panPotUserName, queueItem: item))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportAgapeSuccess(forQueueItem item: QueueItem, source: AgapeSource) {
        http.json(.init(endpoint: .agape(mediaID: item.adMediaId, panPotID: ALUserInfoService.panPotID, source: source))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportAgapeFailure(forQueueItem item: QueueItem, source: AgapeSource, reason: FailReason) {
        http.json(.init(endpoint: .failedAgape(mediaID: item.adMediaId, panPotID: ALUserInfoService.panPotID, source: source, reason: reason))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

    static func reportVideoError(forQueueItem item: QueueItem, statusCode: Int) {
        http.json(.init(endpoint: .videoError(mediaID: item.adMediaId, panPotID: ALUserInfoService.panPotID, statusCode: statusCode))) { (result: Result<NetworkResponse, NetworkingError>) in }
    }

}
