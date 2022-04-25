//
//  KillSwitch.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 01/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

public struct ALPrivacySettings: Codable {

    public var showAds: Bool
    public var country: String?
    public var division: String?
    public var experiment: String
    public var ts: Int
    public var cacheID: String

    enum CodingKeys: String, CodingKey {
        case showAds = "show_ads"
        case country
        case division
        case experiment
        case ts
        case cacheID = "cache_id"
    }

}
