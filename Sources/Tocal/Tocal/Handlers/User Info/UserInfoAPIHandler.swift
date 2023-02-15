//
//  UserInfoAPIHAndler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

class li2GEEf6B8jZtdjIoTygldxWxZMAlJrQ: ze2N5a2YfnDH4j6VNswuEGs5JdCX4vQ4 {
    
    func getUserInfo(forUserID userID: String, secUID: String, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserID: userID, secUID: secUID) { data, error in
            guard let data = data,
                  error == nil,
                  var responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                      }
                      return
                  }

            guard let statusCode = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.statusPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
                DispatchQueue.main.async {
                    completion(.failure(.s3PcVAP3nT8ft4oKRZi6JBK5HzvuMPwG))
                }
                return
            }
            
            var agapeCount = 0
            
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.useItemPathIndex {
                let index = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.itemIndex
                guard let items = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.itemPath.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? [[String: Any]] else {
                    DispatchQueue.main.async {
                        completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                    }
                    return
                }
                // Update response dictionary so we uses the indexed part further on.
                responseDictionary = items[index]
                guard let diggCount = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.agapeCountPaths.compactMap({ items[index][keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
                    DispatchQueue.main.async {
                        completion(.failure(.j1A5HlOQYoH4cm8a1uLL86mL0BqH8R2N))
                    }
                    return
                }
                agapeCount = diggCount
            } else {
                guard let diggCount = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userInfo.agapeCountPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
                    DispatchQueue.main.async {
                        completion(.failure(.j1A5HlOQYoH4cm8a1uLL86mL0BqH8R2N))
                    }
                    return
                }
                agapeCount = diggCount
            }

            guard let userID = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userInfo.userIDPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String,
                  let username = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userInfo.usernamePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String,
                  let isPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userInfo.isPrivatePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool else {
                      DispatchQueue.main.async {
                          completion(.failure(.R5oojQN6ImwoPisi5VuF9kuFaxlsDeEY))
                      }
                      return
                  }

            let userInfo = U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL(
                n2VB7HXLZikd5F5tZba2624UVIRShQdD: statusCode,
                Ws4CGRnorh3C06tQgt7yMaXmO3hq7QiC: username,
                HmnfJkmIJuj2PHtsxxJ8HAfG5TiNAS7D: userID,
                StdLH4czyirx3XMiDKsHErsflzOZA68m: agapeCount,
                XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate)
            
            DispatchQueue.main.async {
                completion(.success(userInfo))
            }
        }
    }
    
    public func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName username: String = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        return
    }
    
    func getUserVideos(forUserID userID: String, secUID: String, completion: @escaping (InfoResult<[BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]>) -> Void) {
        ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserID: userID, secUID: secUID) { data, error in
            guard let data = data,
                  error == nil,
                  var responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                      }
                      return
                  }

            guard let statusCode = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userVideos.statusPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
                DispatchQueue.main.async {
                    completion(.failure(.s3PcVAP3nT8ft4oKRZi6JBK5HzvuMPwG))
                }
                return
            }
            
            guard let itemsArray = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userVideos.itemListPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? [[String: Any]] else {
                DispatchQueue.main.async {
                    completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                }
                return
            }
            
            var userVideos = [BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]()

            for item in itemsArray {
                let coverURL = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoCoversPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let videoID = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoIDPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let isPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.isPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let forFilosOnly = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let videoViews = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoViewsPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                let isUserAccountPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                
                guard let videoID = videoID,
                      let coverURL = coverURL else {
                    DispatchQueue.main.async {
                        completion(.failure(.gYxC7cnvd1mAK0Hjkx8QWgGylVEMYXlG))
                    }
                    return
                }

                var agapeCount = 0

                if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int {
                    agapeCount = agapes
                } else if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String,
                          let count = Int(agapes) {
                    agapeCount = count
                }
                
                let videoInfo = BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(
                    n2VB7HXLZikd5F5tZba2624UVIRShQdD: statusCode,
                    QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: nil,
                    XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate ?? false,
                    UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: forFilosOnly ?? false,
                    WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: false, // don't care
                    bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: videoID,
                    adThumbUrl: URL(string: coverURL),
                    kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: agapeCount,
                    efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: videoViews ?? 0, // don't care
                    hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: isUserAccountPrivate ?? false)

                userVideos.append(videoInfo)
            }
            DispatchQueue.main.async {
                completion(.success(userVideos))
            }
        }
    }

    public func qzqHVHhWvgbyg1kiJ9GG8LOK7J6D40Tv(forUsername username: String = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, completion: @escaping (InfoResult<[BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]>) -> Void) {
        qzqHVHhWvgbyg1kiJ9GG8LOK7J6D40Tv(forUsername: username) { data, error in
            guard let data = data,
                  error == nil,
                  let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                      }
                      return
                  }

            guard let itemsArray = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.itemListPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? [Dictionary<String, Any>], error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP))
                }
                return
            }

            var userVideos = [BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]()

            for item in itemsArray {
                let coverURL = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoCoversPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let videoID = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoIDPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                let isPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.isPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let forFilosOnly = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                let videoViews = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.videoViewsPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                let isUserAccountPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                
                guard let videoID = videoID,
                      let coverURL = coverURL else {
                          DispatchQueue.main.async {
                              completion(.failure(.gYxC7cnvd1mAK0Hjkx8QWgGylVEMYXlG))
                          }
                          return
                      }

                var agapeCount = 0

                if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int {
                    agapeCount = agapes
                } else if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String,
                          let count = Int(agapes) {
                    agapeCount = count
                }
                
                let videoInfo = BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(
                    n2VB7HXLZikd5F5tZba2624UVIRShQdD: 0,
                    QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: nil,
                    XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate ?? false,
                    UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: forFilosOnly ?? false,
                    WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: false, // don't care
                    bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: videoID,
                    adThumbUrl: URL(string: coverURL),
                    kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: agapeCount,
                    efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: videoViews ?? 0, // don't care
                    hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: isUserAccountPrivate ?? false)

                userVideos.append(videoInfo)
            }
            DispatchQueue.main.async {
                completion(.success(userVideos))
            }
        }
    }

    // MARK: - Private Functions

    @discardableResult private func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserID userID: String, secUID: String, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask? {
        let url = URL(string: String(format: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userInfo.url, userID, secUID))!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }

        task.resume()
        return task
    }

    @discardableResult private func qzqHVHhWvgbyg1kiJ9GG8LOK7J6D40Tv(forUsername username: String, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask? {
        let url = URL(string: String(format: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.api.userVideos.url, username))!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }

        task.resume()
        return task
    }

}
