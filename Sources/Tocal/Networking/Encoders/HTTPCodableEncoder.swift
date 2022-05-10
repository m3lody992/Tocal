//
//  HTTPCodableEncoder.swift
// 
//
//  Created by Eric Cartmenez on 17/06/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

public struct w3ApkmcY88QZtRLUUIAPh2iAnSSI2kYY {

    public static func F6layVh5lGINxUletHpF5zBobWny0Z1N<T: Codable> (request: URLRequest, with object: T?) throws -> URLRequest {
        // It would not make any sense to encode a request without a URL.
        guard request.url != nil
        else {
            throw bCeKctB884uomSFlJ6vkcWepLOdoNPtC.t3heA5XMlCzixgjdPTOMFJB79juXfPfg
        }

        guard let object = object
        else {
            return request
        }

        guard let data = try? JSONEncoder().encode(object)
        else {
            return request
        }

        
        // Shadow the request argument as a variable so we can change it
        var request = request
        request.httpBody = data

        return request
    }

}
