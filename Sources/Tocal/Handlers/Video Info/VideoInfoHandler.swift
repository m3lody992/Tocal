//
//  VideoInfoHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 16/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

protocol VideoInfoHandler {

    func loadAndGetVideoInfo(forItem item: QueueItem, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void)
    func getVideoInfo(forURL url: URL, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void)
    
}
