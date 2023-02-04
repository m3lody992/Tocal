//
//  MasterUserInfoHandler.swift
//  PixelSDK
//
//  Created by miha on 19/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

class MasterUserInfoHanlder: UserInfoHandler {
    
    private var handler: UserInfoHandler
    
    public var webView: WKWebView?
    
    init(variation: HandlerVariation) {
        handler = variation.userInfoHandler
    }
    
    func getUserInfo(forUserName username: String, secUID: String, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        handler.getUserInfo(forUserName: username, secUID: secUID, completion: completion)
    }
    
    func getUserVideos(forUsername username: String, completion: @escaping (InfoResult<[VideoInfo]>) -> Void) {
        handler.getUserVideos(forUsername: username, completion: completion)
    }
    
}
