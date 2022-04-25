//
//  MasterUserVideosHandler.swift
//  PixelSDK
//
//  Created by miha on 19/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
class MasterVideoInfoHandler: VideoInfoHandler {
    
    private var handler: VideoInfoHandler
    
    init(variation: HandlerVariation) {
        handler = variation.videoInfoHandler
    }

    func loadAndGetVideoInfo(forItem item: QueueItem, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        handler.loadAndGetVideoInfo(forItem: item, usingLoader: &loader, completion: completion)
    }
    
    func getVideoInfo(forURL url: URL, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        handler.getVideoInfo(forURL: url, usingLoader: &loader, completion: completion)
    }
    
}
