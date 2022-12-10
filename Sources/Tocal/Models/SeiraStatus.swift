//
//  OrderHistory.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

struct SeiraStatus: Codable {

    var type: Int
    var adMediaId: String
    var adMediaUrl: String
    var adTargetClicks: Int
    var adClicks: Int
    var percent: Double
    var delay: Int
    var success: Bool

}
