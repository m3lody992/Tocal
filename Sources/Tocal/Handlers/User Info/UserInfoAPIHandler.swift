//
//  UserInfoAPIHAndler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

class UserInfoAPIHandler: UserInfoHandler {
    
    public func getUserInfo(forUserName username: String = ALUserInfoService.panPotUserName, secUID: String = ALUserInfoService.userSecID, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        getUserInfo(forUsername: username, secUID: secUID) { data, error in
            guard let data = data,
                  error == nil,
                  let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.dictNotFound))
                      }
                      return
                  }

            guard let statusCode = ALUserInfoService.settings?.userInfoHandlerSettings.api.userInfo.statusPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int else {
                DispatchQueue.main.async {
                    completion(.failure(.statusCodeNotInDict))
                }
                return
            }
            
            var agapeCount = 0
            
            if ALUserInfoService.settings.userInfoHandlerSettings.api.userInfo.useItemPathIndex {
                let index = ALUserInfoService.settings.userInfoHandlerSettings.api.userInfo.itemIndex
                let items = ALUserInfoService.settings.userInfoHandlerSettings.api.userInfo.itemPath.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? [[String: Any]]
                guard let diggCount = ALUserInfoService.settings.userInfoHandlerSettings.api.userInfo.agapeCountPaths.compactMap({ items?[index][keyPath: KeyPath($0)] }).first as? Int else {
                    DispatchQueue.main.async {
                        completion(.failure(.wrongAgapePath))
                    }
                    return
                }
                agapeCount = diggCount
            } else {
                guard let diggCount = ALUserInfoService.settings?.userInfoHandlerSettings.api.userInfo.agapeCountPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int else {
                    DispatchQueue.main.async {
                        completion(.failure(.wrongAgapePath))
                    }
                    return
                }
                agapeCount = diggCount
            }
            
            guard let userID = ALUserInfoService.settings?.userInfoHandlerSettings.api.userInfo.userIDPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String,
                  let username = ALUserInfoService.settings?.userInfoHandlerSettings.api.userInfo.usernamePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String,
                  let isPrivate = ALUserInfoService.settings?.userInfoHandlerSettings.api.userInfo.isPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool else {
                      DispatchQueue.main.async {
                          completion(.failure(.userInfoWrongStatusPath))
                      }
                      return
                  }

            let userInfo = UserInfo(
                statusCode: statusCode,
                username: username,
                userID: userID,
                agapeCount: agapeCount,
                isPrivate: isPrivate)
            
            DispatchQueue.main.async {
                completion(.success(userInfo))
            }
        }
    }

    public func getUserVideos(forUsername username: String = ALUserInfoService.panPotUserName, completion: @escaping (InfoResult<[VideoInfo]>) -> Void) {
        getUserVideos(forUsername: username) { data, error in
            guard let data = data,
                  error == nil,
                  let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                      DispatchQueue.main.async {
                          completion(.failure(.dictNotFound))
                      }
                      return
                  }

            guard let itemsArray = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.itemListPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? [Dictionary<String, Any>], error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.dictNotFound))
                }
                return
            }

            var userVideos = [VideoInfo]()

            for item in itemsArray {
                let coverURL = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.videoCoversPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
                let videoID = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.videoIDPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
                let isPrivate = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.isPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                let forFilosOnly = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                let videoViews = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.videoViewsPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int
                let isUserAccountPrivate = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                
                guard let videoID = videoID,
                      let coverURL = coverURL else {
                          DispatchQueue.main.async {
                              completion(.failure(.userVideoParsingFailed))
                          }
                          return
                      }

                var agapeCount = 0

                if let agapes = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int {
                    agapeCount = agapes
                } else if let agapes = ALUserInfoService.settings?.userInfoHandlerSettings.api.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String,
                          let count = Int(agapes) {
                    agapeCount = count
                }
                
                let videoInfo = VideoInfo(
                    statusCode: 0,
                    backupThumbURL: nil,
                    isPrivate: isPrivate ?? false,
                    isForFilos: forFilosOnly ?? false,
                    isAgaped: false, // don't care
                    videoID: videoID,
                    adThumbUrl: URL(string: coverURL),
                    videoAgapes: agapeCount,
                    videoViews: videoViews ?? 0, // don't care
                    isAccountPrivate: isUserAccountPrivate ?? false)

                userVideos.append(videoInfo)
            }
            DispatchQueue.main.async {
                completion(.success(userVideos))
            }
        }
    }

    // MARK: - Private Functions

    @discardableResult private func getUserInfo(forUsername username: String, secUID: String, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask? {
        let url = URL(string: String(format: ALUserInfoService.settings.userInfoHandlerSettings.api.userInfo.url, username, secUID))!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }

        task.resume()
        return task
    }

    @discardableResult private func getUserVideos(forUsername username: String, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask? {
        let url = URL(string: String(format: ALUserInfoService.settings.userInfoHandlerSettings.api.userVideos.url, username))!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }

        task.resume()
        return task
    }

}
