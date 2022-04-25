//
//  MasterAgapeHandler.swift
//  PixelSDK
//
//  Created by miha on 19/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation

class MasterAgapeHandler: AgapeHandler {
    
    private var handler: AgapeHandler
    
    init(variation: HandlerVariation) {
        handler = variation.agapeHandler
    }

    func checkWasVideoAgaped(fromItem item: QueueItem, usingWebViewHandler loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<AgapedStatus>) -> Void) {
        handler.checkWasVideoAgaped(fromItem: item, usingWebViewHandler: &loader, completion: completion)
    }
    
}
