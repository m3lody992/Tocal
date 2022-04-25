//
//  ExistingUser.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 01/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

struct ExistingUser: Codable {

    var ads: Int
    var experiment: String
    var views: Int

    enum CodingKeys: String, CodingKey {
        case ads
        case experiment
        case views
    }

}
