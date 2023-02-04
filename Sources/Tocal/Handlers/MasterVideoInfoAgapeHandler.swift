//
//  MasterVideoInfoAgapeHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 16/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

protocol AgapeHandler {
    func checkWasVideoAgaped(fromItem item: QueueItem, usingWebViewHandler loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<AgapedStatus>) -> Void)
}

protocol UserInfoHandler {
    func getUserInfo(forUserName username: String, secUID: String, completion: @escaping (InfoResult<UserInfo>) -> Void)
    func getUserVideos(forUsername username: String, completion: @escaping (InfoResult<[VideoInfo]>) -> Void)
}

enum HandlerVariation: String, Codable {
    case api
    case dsp
    case js

    var videoInfoHandler: VideoInfoHandler {
        switch self {
        case .api: return VideoInfoAPIHandler()
        case .dsp: return VideoInfoDSPHandler()
        case .js: return VideoInfoJSHandler()
        }
    }
    
    var userInfoHandler: UserInfoHandler {
        switch self {
        case .api: return UserInfoAPIHandler()
        case .dsp: return UserInfoDSPHandler()
        case .js: return UserInfoJSHandler()
        }
    }

    var agapeHandler: AgapeHandler {
        switch self {
        case .api: return InAppAgapeAPIHandler()
        case .dsp: return InAppAgapeDSPHandler()
        case .js: return InAppAgapeJSHandler()
        }
    }
}


class MasterVideoInfoAgapeHandler {

    private (set) var loader = WebViewFunctionalityHandler()
    private var videoInfoVariations: HandlerVariation
    private var agapeVariations: HandlerVariation

    init(videoInfoVariations: HandlerVariation, agapeVariations: HandlerVariation) {
        self.videoInfoVariations = videoInfoVariations
        self.agapeVariations = agapeVariations
    }

    func loadVideoAndGetInfo(forItem item: QueueItem, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        videoInfoVariations.videoInfoHandler.loadAndGetVideoInfo(forItem: item, usingLoader: &self.loader) { result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    completion(.success(info))
                }
                
            case .failure(let reason):
                DispatchQueue.main.async {
                    completion(.failure(reason))
                }
            }
        }
    }
    
    func loadVideo(forItem item: QueueItem, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        loader.loadVideo(forItem: item, completion: completion)
    }
    
    func inAppAgape(item: QueueItem, completion: @escaping (InfoResult<AgapedStatus>) -> Void) {
        // If we don't have the correct video already loaded we load it.
        guard let urlString = loader.loadedURL?.absoluteString, urlString.contains(item.adMediaId) else {
            loader.loadVideo(forItem: item) { [self] result in
                switch result {
                case .success:
                    // Like the video
                    agapeVariations.agapeHandler.checkWasVideoAgaped(fromItem: item, usingWebViewHandler: &loader) { result in
                        switch result {
                        case .success(let wasAgaped):
                            completion(.success(wasAgaped))
                            break
                        case .failure(let reason):
                            completion(.failure(reason))
                        }
                    }
                case .failure(let reason):
                    completion(.failure(reason))
                }
            }
            return
        }
        
        // Like the video
        agapeVariations.agapeHandler.checkWasVideoAgaped(fromItem: item, usingWebViewHandler: &loader) { result in
            switch result {
            case .success(let wasAgaped):
                completion(.success(wasAgaped))
                break
            case .failure(let reason):
                completion(.failure(reason))
            }
        }
    }
    
}
