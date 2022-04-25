//
//  ManualAddHandler.swift
//  PixelSDK
//
//  Created by miha on 25/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation

class ManualAddHandler {
    
    var loader = WebViewFunctionalityHandler()
    let videoInfoHandler = MasterVideoInfoHandler(variation: ALUserInfoService.settings.manualAddHandlerSettings.infoHandlerVariation)
    var retryCounter = 0
    
    func getVideoInfoManualAdd(forURL url: URL, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        func loadAndHandleURL() {
            loader.loadCustomURL(url) { result in
                switch result {
                case .success(let webView):
                    webView?.evaluateJavaScript(ALUserInfoService.settings.manualAddHandlerSettings.getLinkEJS) { result, error in
                        guard let shareURLString = result as? String,
                              let shareURL = URL(string: shareURLString),
                              error == nil else {
                                  if self.retryCounter <= ALUserInfoService.settings.manualAddHandlerSettings.retryCountLimit {
                                      self.retryCounter += 1
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + ALUserInfoService.settings.manualAddHandlerSettings.retryDelay) {
                                          loadAndHandleURL()
                                      }
                                  } else {
                                      self.retryCounter = 0
                                      completion(.failure(.pageLoadFailed))
                                  }
                                  return
                              }
                        self.retryCounter = 0
                        
                        self.videoInfoHandler.getVideoInfo(forURL: shareURL, usingLoader: &self.loader, completion: completion)
                    }
                case .failure(let reason):
                    self.retryCounter = 0
                    completion(.failure(reason))
                }
            }
        }
        
        if ALUserInfoService.settings.manualAddHandlerSettings.useLinkEJS {
            loadAndHandleURL()
        } else {
            videoInfoHandler.getVideoInfo(forURL: url, usingLoader: &loader, completion: completion)
        }
    }
}
