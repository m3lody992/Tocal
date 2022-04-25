//
//  Queue.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 01/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

struct QueueItem: Codable, Equatable, ThumbURLContainable {

    var adMediaId: String
    var adThumbUrl: URL?
    var adVideoUrl: URL
    var adMeta: String
    var adName: String

}
