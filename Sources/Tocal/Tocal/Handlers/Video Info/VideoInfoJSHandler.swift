//
//  VideoInfoJSHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class alnxOwOArtOfkIE3POjkfnGJQUNDxAQ4: N1mJTknBwOXZJWLVLefCo7jKdG8EllRP {

    // MARK: - Interface

    func aeOwQnMvnwy4N4EidYEHLJYJ58tBIyqS(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, usingLoader loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        loader.YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item) { result in
            self.C5oTYMtawvFYL8xQAP3OqyHN0Pif1HCY(item: item, result: result, completion: completion)
        }
    }
    
    func Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL url: URL, usingLoader loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        loader.strK3WgF3cl4GIWQbegrYPS9bi3QLKmK(url) { result in
            self.C5oTYMtawvFYL8xQAP3OqyHN0Pif1HCY(item: nil, result: result, completion: completion)
        }
    }
    
    private func C5oTYMtawvFYL8xQAP3OqyHN0Pif1HCY(item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN? = nil, result: InfoResult<WKWebView?>, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
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
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.statusCodeEJS) { result, error in
                guard let result = result as? Int, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                statusCode = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.isForFilosOnlyEJS) { result, error in
                guard let result = result as? Bool, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                isForFilosOnly = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.isVideoPrivateEJS) { result, error in
                guard let result = result as? Bool, error == nil else {
                    dispatchGroup.leave()
                    return
                }

                isPrivate = result
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.coverURLEJS) { result, error in
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
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.isVideoAgapedEJS) { result, error in
                guard let result = result as? Bool,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                isAgaped = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.videoIDEJS) { result, error in
                guard let result = result as? String,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoID = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.videoAgapesEJS) { result, error in
                guard let result = result as? Int,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoAgapes = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.videoViewsEJS) { result, error in
                guard let result = result as? Int,
                      error == nil else {
                          dispatchGroup.leave()
                          return
                      }

                videoViews = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.js.isAccountPrivateEJS) { result, error in
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
                        completion(.failure(.NoR1z5trbSxBdN1fgPqkJPXxP1BpbBix(statusCode: statusCode ?? 9999)))
                    }
                    return
                }
                
                guard let videoID = videoID else {
                    completion(.failure(.s3PcVAP3nT8ft4oKRZi6JBK5HzvuMPwG))
                    return
                }
                
                let info = BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(
                    n2VB7HXLZikd5F5tZba2624UVIRShQdD: statusCode,
                    QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: item?.adThumbUrl,
                    XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate ?? false,
                    UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: isForFilosOnly ?? false,
                    WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: isAgaped ?? false,
                    bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: videoID,
                    adThumbUrl: coverURL,
                    kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: videoAgapes ?? 0,
                    efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: videoViews ?? 0,
                    hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: isAccountPrivate ?? false)

                completion(.success(info))
            }
        case .failure(let reason):
            completion(.failure(reason))
        }
    }

}


