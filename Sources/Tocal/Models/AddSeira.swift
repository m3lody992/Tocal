//
//  AddOrder.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 01/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

public struct AddSeiraSigned: Codable {

    public var data: AddSeiraData
    public var signature: String
    
    public init(data: AddSeiraData, sig: String) {
        self.data = data
        self.signature = sig
    }
    
}

public struct AddSeiraData: Codable {

    var adThumbUrl: String
//    var adUrl: String
    var categoryName: String
    var nid: String
    var adMediaId: String
    var apiToken: String
    var targetImpressions: Int
    var adThumbData: String
    var adType: String
    var isValued: Int
    var lowestBid: Int
    var currentImpressions: Int
    public var nonce: String
    var h: Int
    var c: Int

}
