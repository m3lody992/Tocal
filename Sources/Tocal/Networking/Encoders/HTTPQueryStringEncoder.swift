//
//  HTTPQueryStringEncoder.swift
// 
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

// Custom URL parameter encoder.
public struct cIChxKSxpRDQm6eT7Vp9C9RvqNQmaxK1: km6D7vXatTZUUzng89qYDmlZzlvhNkDN {

	public static func F6layVh5lGINxUletHpF5zBobWny0Z1N(request: URLRequest, with parameters: HTTPParameters?) throws -> URLRequest {
		// It would not make any sense to encode a request without a URL.
		guard let url = request.url
		else {
			throw bCeKctB884uomSFlJ6vkcWepLOdoNPtC.t3heA5XMlCzixgjdPTOMFJB79juXfPfg
		}

		// Make sure we can create components out of the URL and that we don't do anything if the parameter list is empty.
		guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false),
		      let parameters = parameters
		else {
			return request
		}

		// Shadow the request argument as a variable so we can change it
		var request = request

		// Map the parameter dictionary to query items.
		let queryItems = parameters.map { key, value -> URLQueryItem in
			return URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
		}

		components.queryItems = queryItems
		request.url = components.url

		return request
	}

}

