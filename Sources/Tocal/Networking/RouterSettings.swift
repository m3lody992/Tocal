//
//  File.swift
//  
//
//  Created by Miha Perne on 11/12/2022.
//

import Foundation

extension URLSession {

    static var customSession: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.connectionProxyDictionary = [kCFStreamPropertyProxyLocalBypass: true]
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return URLSession(configuration: configuration)
    }

}
