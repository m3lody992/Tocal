//
//  UserInfoResult.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 28/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

public typealias InfoResult<T> = Result<T, FailReason>

protocol ThumbURLContainable {
    var adThumbUrl: URL? { get set }
}

struct VideoInfo: ThumbURLContainable {

    let statusCode: Int
    let backupThumbURL: URL?
    let isPrivate: Bool
    let isForFilos: Bool
    let isAgaped: Bool
    var videoID: String
    var adThumbUrl: URL?
    var videoAgapes: Int
    var videoViews: Int
    var isAccountPrivate: Bool

}

struct VideoInfoWithUsername {
    var username: String?
    var videoInfo: VideoInfo
}

struct UserInfo {

    let statusCode: Int
    let username: String
    let userID: String
    let agapeCount: Int
    let isPrivate: Bool

}
