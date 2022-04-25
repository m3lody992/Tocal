//
//  Array.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 08/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

extension Array where Element == UInt8 {

    var asString: String? {
        String(bytes: self, encoding: .utf8)
    }

}

