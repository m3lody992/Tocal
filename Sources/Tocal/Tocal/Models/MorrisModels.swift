//
//  File.swift
//  
//
//  Created by arstarstarstar on 11/12/2022.
//

import Foundation
//import InfoServices
import CryptoSwift

public struct GetVideoInfo: Codable {
    public var link: String
    public var nonce: String
    public var signature: String?

    public init(link: String) {
        self.link = link
        self.nonce = UUID().uuidString
        if let hmacBytes = try? HMAC(key: [92, 108, 80, 34, 0, 20, 17, 111, 22, 9, 38, 92, 67, 1, 121, 2, 46, 52, 25, 38, 108, 46, 1, 55, 82, 44, 71, 36, 32, 3, 60, 6, 46, 18, 18, 59, 9].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".OzyVUNvmc4TLU8GfaxCwuc5TctC14y46) {
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
        if let hmacBytes = try? HMAC(key: [92, 108, 80, 34, 0, 20, 17, 111, 22, 9, 38, 92, 67, 1, 121, 2, 46, 52, 25, 38, 108, 46, 1, 55, 82, 44, 71, 36, 32, 3, 60, 6, 46, 18, 18, 59, 9].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".OzyVUNvmc4TLU8GfaxCwuc5TctC14y46) {
            self.signature =  Data(hmacBytes).toHexString()
        } else {
            self.signature = nil
        }
    }

}

public struct GetUserInfoResponse: Codable {
    public let code: Int
    public let avatar: URL?
    public let diggsGiven: Int?
    public let flowerCount: Int?
    public let floweringsCount: Int?
    public let isUserPrivate: Bool?
    public let userSecID: String?
    public let userUID: String?
    public let status: Bool
    public let username: String?
    public let message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case avatar
        case diggsGiven = "digg_count"
        case flowerCount = "follower_count"
        case floweringsCount = "following_count"
        case isUserPrivate = "is_user_private"
        case userSecID = "user_secid"
        case userUID = "user_uid"
        case status
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
        if let hmacBytes = try? HMAC(key: [92, 108, 80, 34, 0, 20, 17, 111, 22, 9, 38, 92, 67, 1, 121, 2, 46, 52, 25, 38, 108, 46, 1, 55, 82, 44, 71, 36, 32, 3, 60, 6, 46, 18, 18, 59, 9].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, variant: .sha2(.sha256)).authenticate("\(self.link)\(self.nonce)".OzyVUNvmc4TLU8GfaxCwuc5TctC14y46) {
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

    var asVideoInfo: BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8 {
        return BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(n2VB7HXLZikd5F5tZba2624UVIRShQdD: 0, QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: nil, XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate, UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: false, WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: false, bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: id, adThumbUrl: thumbURL, kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: agapeCount, efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: viewCount, hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: false)
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
        if let hmacBytes = try? HMAC(key: [92, 108, 80, 34, 0, 20, 17, 111, 22, 9, 38, 92, 67, 1, 121, 2, 46, 52, 25, 38, 108, 46, 1, 55, 82, 44, 71, 36, 32, 3, 60, 6, 46, 18, 18, 59, 9].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, variant: .sha2(.sha256)).authenticate("\(type)\(count)\(data)\(nonce)".OzyVUNvmc4TLU8GfaxCwuc5TctC14y46) {
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

    var asSeiraStatus: nJABHWKQALbz0dS2a8NMIX9DLknT2EG3 {
        nJABHWKQALbz0dS2a8NMIX9DLknT2EG3(type: type, adMediaId: "", adMediaUrl: "", adTargetClicks: ordered, adClicks: received, percent: percent, delay: time, success: completed.boolValue)
    }
}

public struct OrderStatusResponse: Codable {
    var data: [OrderStatusData]
}
