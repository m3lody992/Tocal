//
//  HTTPHeaderEncoder.swift
// 
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

// Custom HTTP header encoder.
public struct X2lCrNHjJcGL4k2krdz4ZBGSpnjfGzxE: km6D7vXatTZUUzng89qYDmlZzlvhNkDN {

	public static func F6layVh5lGINxUletHpF5zBobWny0Z1N(request: URLRequest, with parameters: HTTPParameters?) throws -> URLRequest {
		// We should not proceed if we don't have a valid URL.
		guard request.url != nil
		else {
			throw bCeKctB884uomSFlJ6vkcWepLOdoNPtC.t3heA5XMlCzixgjdPTOMFJB79juXfPfg
		}

		// Do not proceed if the headers are empty.
		guard let parameters = parameters
		else {
			return request
		}

		// Make the request parameter a variable, so we can modify it.
		var request = request

		// Iterate through each keypair and set the HTTP headers.
		parameters.forEach { key, value in
			request.setValue("\(value)", forHTTPHeaderField: key)
		}

		return request
	}

}

