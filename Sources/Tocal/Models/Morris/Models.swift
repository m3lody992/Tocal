//
//  File.swift
//  
//
//  Created by st on 22/11/2022.
//

import Foundation
import InfoServices
import CryptoSwift

public struct GetVideoInfo: Codable {
    public var link: String
    public var nonce: String
    public var signature: String?
    
    public init(link: String) {
        self.link = link
        self.nonce = UUID().uuidString
        if let hmacBytes = try? HMAC(key: "// UInt8 can't store negative numbers", variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".asUInt8Array) {
            self.signature =  Data(hmacBytes).toHexString()
        } else {
            self.signature = nil
        }
    }
    
}

public struct GetVideoInfoResponse: Codable {
    public let code: Int
    public let isUserPrivate: Bool
    public let isVideoPrivate: Bool
    public let agapeCount: Int
    public let message: String
    public let playCount: Int
    public let status: Bool
    public let videoID: Int
    
    enum CodingKeys: String, CodingKey {
        case code
        case isUserPrivate = "is_user_private"
        case isVideoPrivate = "is_video_private"
        case agapeCount = "like_count"
        case message
        case playCount = "play_count"
        case status
        case videoID = "video_id"
    }
}

public struct GetUserInfo: Codable {
    public var link: String
    public var nonce: String
    public var signature: String?
    
    public init(link: String) {
        self.link = link
        self.nonce = UUID().uuidString
        if let hmacBytes = try? HMAC(key: "// UInt8 can't store negative numbers", variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".asUInt8Array) {
            self.signature =  Data(hmacBytes).toHexString()
        } else {
            self.signature = nil
        }
    }
    
}

public struct GetUserInfoResponse: Codable {
    public let code: Int
    public let avatar: URL?
    public let diggsGotten: Int?
    public let diggsGiven: Int?
    public let flowerCount: Int?
    public let floweringsCount: Int?
    public let isUserPrivate: Bool?
    public let userSecID: String?
    public let userUID: String?
//    public let status: Bool
    public let username: String?
    public let message: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case avatar
        case diggsGotten = "digg_count"
        case diggsGiven = "favoriting_count"
        case flowerCount = "follower_count"
        case floweringsCount = "following_count"
        case isUserPrivate = "is_user_private"
        case userSecID = "user_secid"
        case userUID = "user_uid"
//        case status
        case username
        case message
    }
}

public struct GetUserPosts: Codable {
    public var link: String
    public var pagination: Int
    public var nonce: String
    public var signature: String?
    
    public init(link: String, pagination: Int) {
        self.link = link
        self.pagination = pagination
        self.nonce = UUID().uuidString
        if let hmacBytes = try? HMAC(key: "// UInt8 can't store negative numbers", variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".asUInt8Array) {
            self.signature =  Data(hmacBytes).toHexString()
        } else {
            self.signature = nil
        }
    }
    
}

public struct UserPost: Codable {
    public let authorSecUID: String
    public let authorUID: String
    public let isPrivate: Bool
    public let agapeCount: Int
    public let viewCount: Int
    public let decription: String
    public let id: String
    public let thumbURL: URL
    
    enum CodingKeys: String, CodingKey {
        case authorSecUID = "author_secuid"
        case authorUID = "author_uid"
        case isPrivate = "is_video_private"
        case agapeCount = "number_of_likes"
        case viewCount = "number_of_views"
        case decription = "video_desc"
        case id = "video_id"
        case thumbURL = "video_thumb_url"
    }
    
    var asVideoInfo: VideoInfo {
        return VideoInfo(statusCode: 0, backupThumbURL: nil, isPrivate: isPrivate, isForFilos: false, isAgaped: false, videoID: id, adThumbUrl: thumbURL, videoAgapes: agapeCount, videoViews: viewCount, isAccountPrivate: false)
    }
}

public struct GetUserPostsResponse: Codable {
    public let code: Int
    public let hasMore: Bool
    public let message: String
    public let pagination: Int
    public let posts: [UserPost]
    public let secUID: String
    public let status: Bool
    public let username: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case hasMore = "has_more"
        case message
        case pagination
        case posts
        case secUID = "sec_uid"
        case status
        case username
    }
}

public struct SubmitOrder: Codable {
    public var type: Int
    public var count: Int
    public var data: String
    public var nonce: String
    public var signature: String?
    
    public init(type: Int, count: Int, data: String) {
        self.type = type
        self.count = count
        self.data = data
        self.nonce = UUID().uuidString
        if let hmacBytes = try? HMAC(key: "// UInt8 can't store negative numbers", variant: .sha2(.sha256)).authenticate("\(type)\(count)\(data)\(nonce)".asUInt8Array) {
            self.signature = Data(hmacBytes).toHexString()
        } else {
            self.signature = nil
        }
    }
    
}

public struct SubmitOrderResponse: Codable {
    public let charge: Double
    public let code: Int
    public let id: String
    public let message: String
    public let status: Bool
}

//{  "data":
//    [
//      {
//"created_on": "2022-12-05 08:07:55",
//"order_count": "10",
//"amount_received": "0",
//"perecnt_done": null,
//"completed": "1",
//"upstream_status": "3",
//"wait_time_minutes": "1521"
//}
//    ]
//}
extension Int {
    var boolValue: Bool { return self != 0 }
}

public struct OrderStatusData: Codable {
    var created: String
    var ordered: Int
    var received: Int
    var percent: Double
    var type: String
    var completed: Int
    var status: Int
    var time: Int
    
    enum CodingKeys: String, CodingKey {
        case created = "created_on"
        case ordered = "order_count"
        case received = "amount_received"
        case percent = "percent_done"
        case type = "order_type"
        case completed
        case status = "upstream_status"
        case time = "wait_time_minutes"
    }
    
    var asSeiraStatus: SeiraStatus {
        SeiraStatus(adMediaId: "", adMediaUrl: "", adTargetClicks: ordered, adClicks: received, percent: percent, delay: time, success: completed.boolValue)
    }
}

public struct OrderStatusResponse: Codable {
    var data: [OrderStatusData]
}
