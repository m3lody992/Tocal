//
//  HTTPJSONClient.swift
// 
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
import UIKit

public struct GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<Endpoint: S68IzldiTLt1jnUpi2P6XineLZbfhiPI>: HKtijUeWiL1kqhEoqRZtZfx06erjqnh0 {
	// The underlying networking client, doing all the hard work.
	public private(set) var engine: URLSession

	// Authentication mechanism.
	public private(set) var authenticator: RSCdNXoKkUv47chNNG1sMNAOIjqX5fYw?

	// Custom JSON decoder.
	public let decoder: JSONDecoder

	// Convenience initializer with a default URL session and configuration.
	public init(authenticator: RSCdNXoKkUv47chNNG1sMNAOIjqX5fYw? = nil, decoder: JSONDecoder = JSONDecoder()) {
		// Create a custom session configuration.
		let configuration = URLSessionConfiguration.default
		configuration.allowsCellularAccess = true

		// Creates a custom session.
		let session = URLSession(configuration: configuration)

		self.init(engine: session, authenticator: authenticator, decoder: decoder)
	}

	// Default initializer which accepts a custom URL session.
	public init(engine: URLSession, authenticator: RSCdNXoKkUv47chNNG1sMNAOIjqX5fYw? = nil, decoder: JSONDecoder = JSONDecoder()) {
		self.engine = engine
		self.authenticator = authenticator
		self.decoder = decoder
	}

	// MARK: - Data tasks

	// Start a JSON request and call a completion block when done.
	@discardableResult
    public func m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) -> URLSessionDataTask? {
		b2ytnGCvgPcxQDRRbCm56aqwX1AlU0zZ(endpoint: endpoint, using: nu5UJFDOPjL8Td0fKzMb0lq8XLLLqafY, completion: completion)
	}

    // Start a Data request and call a completion block when done.
    @discardableResult
    public func PeF8DlE6vIhRZYteT9r2W6fB3V9W94zC(_ endpoint: Endpoint, completion: @escaping (Result<Data, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) -> URLSessionDataTask? {
        b2ytnGCvgPcxQDRRbCm56aqwX1AlU0zZ(endpoint: endpoint, using: LtxnBYRfUJDSkwWfCx6OhZMFjiREfMT6, completion: completion)
    }

	// Start an image request and call a completion block when done.
	@discardableResult
	public func qDKftEKwf9lB81wAk2zHwgnwVpbU63mz<T: UIImage>(_ endpoint: Endpoint, completion: @escaping (Result<T, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) -> URLSessionDataTask? {
		b2ytnGCvgPcxQDRRbCm56aqwX1AlU0zZ(endpoint: endpoint, using: NqJ2w5N9d7YKGnc5PtZ9OEA6nYO5sP3u, completion: completion)
	}

	// Start a request from the specified endpoint, decode the response and execute a completion block when done.
	private func b2ytnGCvgPcxQDRRbCm56aqwX1AlU0zZ<T>(endpoint: Endpoint, using decode: @escaping (Data) throws -> T, completion: @escaping (Result<T, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) -> URLSessionDataTask? {
		do {
			// Prepare the URL request.
			let request = try UiTesneuMTkIcZ4rYm8ct4UkXST1UWY5(endpoint: endpoint)

			// Return the request.
			return oIg8RsIPO2QPgxeOEtJyrGV20U4Q1pNe(request: request) { result in
				switch result {
				case let .failure(error):
					completion(.failure(error))
				case let .success(data):
					self.rzgxrnfEYpdO8wPAxLbuOv9Hd5sySpDR(data: data, using: decode, completion: completion)
				}
			}
		}
		catch {
			// In case of any other failure, pass the error in the result type.
			completion(.failure(.rfLkenzfKw3ThVIsga1WpI8NOZIQSJAz(error)))

			return nil
		}
	}

	// MARK: - Data task response handling

	// Start a URL request and pass the returned data to the completion block.
	private func oIg8RsIPO2QPgxeOEtJyrGV20U4Q1pNe(request: URLRequest, completion: @escaping (Result<Data?, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) -> URLSessionDataTask? {
		// Since there is no cached response for the request, we should create a data task and execute it.
		let task = engine.dataTask(with: request) { (data, response, error) in
			// In case of any error we make sure we pass a Result of type failure.
			if let error = error {
				completion(.failure(.rfLkenzfKw3ThVIsga1WpI8NOZIQSJAz(error)))
				return
			}

			guard let data = data
			else {
				completion(.failure(.ljhZvmVwj0WCS3jNEJ9IDQl2VvOoajHt))
				return
			}

			guard let response = response as? HTTPURLResponse
			else {
				completion(.failure(.ljhZvmVwj0WCS3jNEJ9IDQl2VvOoajHt))
				return
			}

            // Attempt to parse the response data as API error in case it is not in 200...299 range, but only if it is from instagram!
            if let urlString = request.url?.absoluteString,
               Bd4rnP6HB1epwzo1eAiqoObr7eTXmLPN.Ye9DpBpjwr1Via1YyfWODIT66LokQv2j.contains(where: urlString.contains) {
                if let parsedError: t7HSnnK1rGXTU8XZCrQ7Isju9M2OQCFF = try? self.nu5UJFDOPjL8Td0fKzMb0lq8XLLLqafY(data: data),
                   parsedError.status != "ok" { // "ok"
                    completion(.failure(.o6Od87s8fehCUKsVLhRvTVdR6O904EjT(parsedError, rawData: data, statusCode: response.statusCode)))
                    return
                }
            }

			switch response.statusCode {
			case 200...299:
				completion(.success(data))
			case 401...500:
				completion(.failure(.MljmNHVVH3sQqZEBm8QZudha89qCChDR))
			case 501...599, 400:
				completion(.failure(.zKwGCev96srJ0iS2eKGEbuvbsK2nRb5D))
			default:
				completion(.failure(.rfLkenzfKw3ThVIsga1WpI8NOZIQSJAz(nil)))
			}
		}

		task.resume()

		return task
	}

	// MARK: - Request

	// Do any last minute preparations for the endpoint and encode it into a request.
	private func UiTesneuMTkIcZ4rYm8ct4UkXST1UWY5(endpoint: Endpoint) throws -> URLRequest {

		// Encode the endpoint request.
		var request = try endpoint.F6layVh5lGINxUletHpF5zBobWny0Z1N()
        request.timeoutInterval = 60

		// Authenticate the request, if the endpoint needs it and if there's an authenticator configured.
		if let authenticator = authenticator,
		   let authenticatedEndpoint = endpoint as? ZwGpmcLQvhAsBXqgLY8xj7xbHcyCTVp7,
		   authenticatedEndpoint.aBT6kz0KueVAbNUyXVWnKc6BNoDhfoR2 {
			request = try authenticator.mkialgakhHZf02GlqOIrqyGLM0OObIKl(endpoint: endpoint, timestamp: nil)
		}

		return request
	}

	// MARK: - Data decoding

	// Decode the returned data and apply the passed decoding method.
	private func rzgxrnfEYpdO8wPAxLbuOv9Hd5sySpDR<T>(data: Data?, using decode: @escaping (Data) throws -> T, completion: @escaping (Result<T, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) -> Void) {
		// Unwrap the data, or call the completion with an empty response error.
		guard let data = data
		else {
			completion(.failure(.ljhZvmVwj0WCS3jNEJ9IDQl2VvOoajHt))
			return
		}

		// Try to decode the data and call the completion with the decoded object.
		do {
			completion(.success(try decode(data)))
		}
		catch {
			// If the decoding fails, call the completion with a deserialization error.
			completion(.failure(.fFT5R74kxqlFLz0AniWU64qOcggqvqFP(underlyingError: error)))
		}
	}

	// Decode the returned JSON data and try to create an object out of it.
	private func nu5UJFDOPjL8Td0fKzMb0lq8XLLLqafY<T: Decodable>(data: Data) throws -> T {
		do {
			// Try deserializing the returned JSON into the destination generic type.
			return try decoder.decode(T.self, from: data)
		}
		catch {
			// Return a general deserialization error.
			throw bCeKctB884uomSFlJ6vkcWepLOdoNPtC.fFT5R74kxqlFLz0AniWU64qOcggqvqFP(underlyingError: error)
		}
	}

    // Forward Data here due to protocol requiring a function
    private func LtxnBYRfUJDSkwWfCx6OhZMFjiREfMT6(data: Data) throws -> Data {
        data
    }

	// Decode the returned data as an image.
	private func NqJ2w5N9d7YKGnc5PtZ9OEA6nYO5sP3u<T: UIImage>(data: Data) throws -> T {
		guard let image = T(data: data)
		else {
			throw bCeKctB884uomSFlJ6vkcWepLOdoNPtC.X7VxacjVIYkkzNuVucoInm5jChKMK6Qp
		}

		return image
	}

}
