//
//  YAPProduct.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 04/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

public struct YapProduct {

    public let id: String
    public let asters: Int

    public init(id: String, asters: Int) {
        self.asters = asters
        self.id = id
    }

}
