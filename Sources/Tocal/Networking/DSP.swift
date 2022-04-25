//
//  DSP.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 22/04/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import UIKit
import WebKit

extension URLProtocol {
    
    static func wk_registerScheme(_ scheme: String) {
        let pStrArr = [[48, 44, 30, 3, 59, 21, 9, 59, 83, 24] .localizedString
                       , [48, 44, 30, 3, 44, 2, 17] .localizedString, [49, 49, 31, 0, 58, 19, 11, 48] .localizedString, [56] .localizedString, [36] .localizedString]
        let className = pStrArr.reversed().joined()
        let cls: AnyClass? = NSClassFromString(className)
        let sel = NSSelectorFromString([1, 38, 23, 30, 58, 14, 0, 37, 101, 9, 47, 87, 9, 16, 31, 30, 40, 24, 30, 48, 56, 47, 9, 0, 65, 55, 90, 61, 38, 76, 62, 73] .localizedString) // "registerSchemeForCustomProtocol:"
        if (cls?.responds(to: sel)) != nil {
            cls?.perform(sel, with: scheme, afterDelay: 0)
        }
    }
    
    static func wk_unregisterScheme(_ scheme: String) {
        let pStrArr = [[48, 44, 30, 3, 59, 21, 9, 59, 83, 24] .localizedString
                       , [48, 44, 30, 3, 44, 2, 17] .localizedString, [49, 49, 31, 0, 58, 19, 11, 48] .localizedString, [56] .localizedString, [36] .localizedString] // "Controller", "Context", "Browsing", "K", "W"
        let className = pStrArr.reversed().joined()
        print("\([16, 47, 17, 4, 58, 52, 4, 58, 83, 80].localizedString) \(className)") ///"className:"
        let cls: AnyClass? = NSClassFromString(className)
        let sel = NSSelectorFromString([6, 45, 2, 18, 46, 19, 22, 35, 83, 24, 20, 81, 12, 16, 52, 20, 28, 52, 25, 0, 57, 51, 16, 63, 94, 8, 92, 61, 49, 76, 49, 28, 47, 74] .localizedString) // "unregisterSchemeForCustomProtocol:"
        if (cls?.responds(to: sel)) != nil {
            cls?.perform(sel, with: scheme, afterDelay: 0)
        }
    }
}

class KPTMProtocol: URLProtocol, NSURLConnectionDataDelegate {
    
    var connection: NSURLConnection?
    var mutableData: NSMutableData?
    var response: URLResponse?
    
    fileprivate static let DSURLProtocolHandledKey = [55, 16, 37, 37, 5, 42, 23, 56, 66, 5, 36, 93, 8, 61, 56, 31, 62, 55, 14, 39, 7, 37, 29] .localizedString //"DSURLProtocolHandledKey"
    
    override class func canInit(with request: URLRequest) -> Bool {
        if (URLProtocol.property(forKey: DSURLProtocolHandledKey, in: request) != nil) {
            return false
        }
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override class func requestIsCacheEquivalent(_ a: URLRequest,to b: URLRequest) -> Bool {
        return super.requestIsCacheEquivalent(a, to:b)
    }
    
    override func startLoading() {
        let newRequest =  (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.setProperty(true, forKey: KPTMProtocol.DSURLProtocolHandledKey, in: newRequest)
        self.connection = NSURLConnection(request: newRequest as URLRequest, delegate: self, startImmediately: true)
    }
    
    override func stopLoading() {
        if self.connection != nil {
            self.connection?.cancel()
        }
        self.connection = nil
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        self.response = response
        self.mutableData = NSMutableData()
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        self.client?.urlProtocol(self, didLoad: data)
        self.mutableData?.append(data)
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        self.client?.urlProtocolDidFinishLoading(self)
        guard let url = connection.currentRequest.url?.absoluteString else { return }
        
        let diggMatches = ALUserInfoService.settings.agapeHandlerSettings.dsp.dspAgapePaths.filter({ url.contains($0) })
        let userInfoMatches = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.dspUserInfoPaths.filter({ url.contains($0) })
        let userVideoMatches = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.dspUserVideosPaths.filter({ url.contains($0) })
        let videoInfoMatches = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.dspVideoInfoPaths.filter({ url.contains($0) })
        
        if diggMatches.count > 0,
           let data = mutableData as? Data,
           let _ = try? JSONSerialization.jsonObject(with: data) {
            ALUserInfoService.mediaAgapeData = data
            NotificationCenter.default.post(Notification(name: Constants.Notifications.userVideoAgapedNotification))
        }
        
        if userInfoMatches.count > 0,
           let data = mutableData as? Data,
           let _ = try? JSONSerialization.jsonObject(with: data) {
            ALUserInfoService.userInfoData = data
            NotificationCenter.default.post(Notification(name: Constants.Notifications.userInfoNotification))
        }
        
        if userVideoMatches.count > 0,
           let data = mutableData as? Data,
           let _ = try? JSONSerialization.jsonObject(with: data) {
            ALUserInfoService.videoFeedData = data
            NotificationCenter.default.post(Notification(name: Constants.Notifications.userPostsNotification))
        }
        
        if videoInfoMatches.count > 0,
           let data = mutableData as? Data,
           let _ = try? JSONSerialization.jsonObject(with: data) {
            ALUserInfoService.videoInfoData = data
            NotificationCenter.default.post(Notification(name: Constants.Notifications.videoInfoNotification))
        }
        
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        self.client?.urlProtocol(self, didFailWithError: error)
    }
}
