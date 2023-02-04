//
//  VideoInfoJSHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class VideoInfoJSHandler: VideoInfoHandler {

    // MARK: - Interface

    func loadAndGetVideoInfo(forItem item: QueueItem, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        loader.loadVideo(forItem: item) { result in
            self.handleWebViewResult(item: item, result: result, completion: completion)
        }
    }
    
    func getVideoInfo(forURL url: URL, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        loader.loadCustomURL(url) { result in
            self.handleWebViewResult(item: nil, result: result, completion: completion)
        }
    }
    
    private func handleWebViewResult(item: QueueItem? = nil, result: InfoResult<WKWebView?>, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        switch result {
        case .success(let webView):
            let dispatchGroup = DispatchGroup()
            
            var statusCode: Int?
            var isForFilosOnly: Bool?
            var isPrivate: Bool?
            var coverURL: URL?
            var isAgaped: Bool?
            var videoID: String?
            var videoAgapes: Int?
            var videoViews: Int?
            var isAccountPrivate: Bool?

            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.statusCodeEJS) { result, error in
                guard let result = result as? Int, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                statusCode = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.isForFilosOnlyEJS) { result, error in
                guard let result = result as? Bool, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                isForFilosOnly = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.isVideoPrivateEJS) { result, error in
                guard let result = result as? Bool, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                isPrivate = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.coverURLEJS) { result, error in
                guard let result = result as? String,
                      let url = URL(string: result),
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                coverURL = url
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.isVideoAgapedEJS) { result, error in
                guard let result = result as? Bool,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                isAgaped = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.videoIDEJS) { result, error in
                guard let result = result as? String,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoID = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.videoAgapesEJS) { result, error in
                guard let result = result as? Int,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoAgapes = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.videoViewsEJS) { result, error in
                guard let result = result as? Int,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoViews = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(ALUserInfoService.settings.videoInfoHandlerSettings.js.isAccountPrivateEJS) { result, error in
                guard let result = result as? Bool,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                isAccountPrivate = result
                dispatchGroup.leave()
            }

            dispatchGroup.notify(queue: .main) {
                guard let statusCode = statusCode, statusCode == 0 else {
                    DispatchQueue.main.async {
                        completion(.failure(.statusCodeNotZero(statusCode: statusCode ?? 9999)))
                    }
                    return
                }
                guard let videoID = videoID else {
                    completion(.failure(.statusCodeNotInDict))
                    return
                }
                
                let info = VideoInfo(
                    statusCode: statusCode,
                    backupThumbURL: item?.adThumbUrl,
                    isPrivate: isPrivate ?? false,
                    isForFilos: isForFilosOnly ?? false,
                    isAgaped: isAgaped ?? false,
                    videoID: videoID,
                    adThumbUrl: coverURL,
                    videoAgapes: videoAgapes ?? 0,
                    videoViews: videoViews ?? 0,
                    isAccountPrivate: isAccountPrivate ?? false)

                completion(.success(info))
            }
        case .failure(let reason):
            completion(.failure(reason))
        }
    }

}


