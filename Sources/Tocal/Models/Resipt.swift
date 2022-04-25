//
//  Resipt.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 11/09/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

struct Resipt: Codable {

    var resiptDataString: String

    enum CodingKeys: String, CodingKey {
        case resiptDataString = "receipt-data"
    }

}
