//
//  VideoInfoAPIHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class VideoInfoAPIHandler: VideoInfoHandler {

    // MARK: - Interface
    
    func loadAndGetVideoInfo(forItem item: QueueItem, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {

        var sharedFailReason: FailReason?
        var videoInfo: VideoInfo?

        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        loader.loadVideo(forItem: item) { result in
            if case .failure(let reason) = result {
                sharedFailReason = reason
            }
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        VideoInfoAPIHandler.getVideoInfo(forItem: item) { result in
            switch result {
            case .success(let info):
                videoInfo = info
            case .failure(let reason):
                sharedFailReason = reason
            }
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            if let sharedFailReason = sharedFailReason {
                completion(.failure(sharedFailReason))
                return
            } else {
                guard let videoInfo = videoInfo else {
                    // This should never happen
                    completion(.failure(.failed))
                    return
                }

                completion(.success(videoInfo))
            }
        }
    }
    
    func getVideoInfo(forURL url: URL, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        VideoInfoAPIHandler.getVideoInfo(forURL: url, queueItem: nil, completion: completion)
    }
    
    static func getVideoInfo(forURL url: URL, queueItem item: QueueItem? = nil, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.failed))
                }
                return
            }

            guard let data = data,
                  let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.dictNotFound))
                      }
                      return
                  }
            
            let statusCode = ALUserInfoService.settings.videoInfoHandlerSettings.api.statusCodePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
            
            guard let statusCode = statusCode, statusCode == 0 else {
                DispatchQueue.main.async {
                    completion(.failure(.statusCodeNotZero(statusCode: statusCode ?? 9999)))
                }
                return
            }
            
            let adThumbUrl = ALUserInfoService.settings.videoInfoHandlerSettings.api.coverURLPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String
            let isPrivate = ALUserInfoService.settings.videoInfoHandlerSettings.api.isPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
            let isForFilos = ALUserInfoService.settings.videoInfoHandlerSettings.api.isForFilosPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
            let isAgaped = ALUserInfoService.settings.videoInfoHandlerSettings.api.isAgapedPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
            let videoID = ALUserInfoService.settings.videoInfoHandlerSettings.api.videoIDPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String
            let videoAgapes = ALUserInfoService.settings.videoInfoHandlerSettings.api.videoAgapesPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
            let videoViews = ALUserInfoService.settings.videoInfoHandlerSettings.api.videoViewsPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
            let isAccountPrivate = ALUserInfoService.settings.videoInfoHandlerSettings.api.isAccountPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool

            guard let videoID = videoID,
                let adThumbURL = adThumbUrl else {
                    DispatchQueue.main.async {
                        completion(.failure(.statusCodeNotInDict))
                    }
                    return
                }
            
            let videoInfo = VideoInfo(
                statusCode: statusCode,
                backupThumbURL: item?.adThumbUrl,
                isPrivate: isPrivate ?? false,
                isForFilos: isForFilos ?? false,
                isAgaped: isAgaped ?? false,
                videoID: videoID,
                adThumbUrl: URL(string: adThumbURL),
                videoAgapes: videoAgapes ?? 0,
                videoViews: videoViews ?? 0,
                isAccountPrivate: isAccountPrivate ?? false
            )

            DispatchQueue.main.async {
                completion(.success(videoInfo))
            }
        }
        task.resume()
    }

    static func getVideoInfo(forItem item: QueueItem, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        let url = URL(string: String(format: ALUserInfoService.settings.videoInfoHandlerSettings.api.url, item.adMediaId))!
        getVideoInfo(forURL: url, queueItem: item, completion: completion)
    }

}

