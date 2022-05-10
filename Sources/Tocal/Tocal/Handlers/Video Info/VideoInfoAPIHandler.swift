//
//  VideoInfoAPIHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl: N1mJTknBwOXZJWLVLefCo7jKdG8EllRP {

    // MARK: - Interface
    
    func aeOwQnMvnwy4N4EidYEHLJYJ58tBIyqS(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, usingLoader loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {

        var sharedFailReason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7?
        var videoInfo: BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8?

        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        loader.YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item) { result in
            if case .failure(let reason) = result {
                sharedFailReason = reason
            }
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forItem: item) { result in
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
                    completion(.failure(.FcZQGrfLSfR3kkjjJgexzvQ7pPfKmuLL))
                    return
                }

                completion(.success(videoInfo))
            }
        }
    }
    
    func Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL url: URL, usingLoader loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL: url, queueItem: nil, completion: completion)
    }
    
    static func Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL url: URL, queueItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN? = nil, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.FcZQGrfLSfR3kkjjJgexzvQ7pPfKmuLL))
                }
                return
            }

            guard let data = data,
                  let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                      }
                      return
                  }
            
            let statusCode = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.statusCodePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                let adThumbUrl = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.coverURLPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let isPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.isPrivatePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let isForFilos = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.isForFilosPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let isAgaped = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.isAgapedPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let videoID = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.videoIDPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let videoAgapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.videoAgapesPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                let videoViews = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.videoViewsPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                let isAccountPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.isAccountPrivatePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool

            guard let statusCode = statusCode,
            let videoID = videoID,
                let adThumbURL = adThumbUrl else {
                    DispatchQueue.main.async {
                        completion(.failure(.s3PcVAP3nT8ft4oKRZi6JBK5HzvuMPwG))
                    }
                    return
                }
            
            let videoInfo = BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(
                n2VB7HXLZikd5F5tZba2624UVIRShQdD: statusCode,
                QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: item?.adThumbUrl,
                XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate ?? false,
                UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: isForFilos ?? false,
                WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: isAgaped ?? false,
                bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: videoID,
                adThumbUrl: URL(string: adThumbURL),
                kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: videoAgapes ?? 0,
                efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: videoViews ?? 0,
                hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: isAccountPrivate ?? false
            )

            DispatchQueue.main.async {
                completion(.success(videoInfo))
            }
        }
        task.resume()
    }

    static func Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        let url = URL(string: String(format: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoHandlerSettings.api.url, item.adName,item.adMediaId))!
        Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL: url, queueItem: item, completion: completion)
    }

}

