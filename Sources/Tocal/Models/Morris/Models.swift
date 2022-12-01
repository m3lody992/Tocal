//
//  File.swift
//  
//
//  Created by st on 22/11/2022.
//

import Foundation
import InfoServices
import CryptoSwift

public protocol LinkSignable: Codable {
    var link: String { get set }
    var nonce: String { get set }
    var signature: String? { get }
}

public extension LinkSignable {
    var signature: String? {
        guard let hmacBytes = try? HMAC(key: "\(link)\(nonce)", variant: .sha2(.sha256)).authenticate("// UInt8 can't store negative numbers".asUInt8Array) else {
                return nil
        }
        return Data(hmacBytes).toHexString()
    }
}


public struct GetVideoInfo: LinkSignable, Codable {
    public var link: String
    public var nonce: String
    
    public init(link: String) {
        self.link = link
        self.nonce = UUID().uuidString
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

public struct GetUserInfo: LinkSignable, Codable {
    public var link: String
    public var nonce: String
    
    public init(link: String) {
        self.link = link
        self.nonce = UUID().uuidString
    }
    
}

public struct GetUserInfoResponse: Codable {
    public let code: Int
    public let isUserPrivate: Bool?
    public let userSecID: String?
    public let userUID: String?
    public let status: Bool
    public let username: String?
    public let message: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case isUserPrivate = "is_user_private"
        case userSecID = "user_secid"
        case userUID = "user_uid"
        case status
        case username
        case message
    }
}

public struct GetUserPosts: LinkSignable, Codable {
    public var link: String
    public var pagination: Int
    public var nonce: String
    
    public init(link: String, pagination: Int) {
        self.link = link
        self.pagination = pagination
        self.nonce = UUID().uuidString
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
}

public protocol OrderSignable: Codable {
    var type: Int { get set }
    var count: Int { get set }
    var data: String { get set }
    var nonce: String { get set }
    var signature: String? { get }
}

public extension OrderSignable {
    
    var signature: String? {
        guard let hmacBytes = try? HMAC(key: "\(type)\(count)\(data)\(nonce)", variant: .sha2(.sha256)).authenticate("// UInt8 can't store negative numbers".asUInt8Array) else {
                return nil
        }
        return Data(hmacBytes).toHexString()
    }

}

public struct GetUserPostsResponse: Codable {
    public let code: Int
    public let hasMore: Bool
    public let message: String
    public let pagination: Int
    public let posts: [UserPost]
    public let secUID: String
    public let status: String
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

public struct SubmitOrder: Codable, OrderSignable {
    public var type: Int
    public var count: Int
    public var data: String
    public var nonce: String
    
    public init(type: Int, count: Int, data: String) {
        self.type = type
        self.count = count
        self.data = data
        self.nonce = UUID().uuidString
    }
    
}

public struct SubmitOrderResponse: Codable {
    public let charge: Double
    public let code: Int
    public let id: String
    public let message: String
    public let status: Bool
}
