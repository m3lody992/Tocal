//
//  Configuration.swift
//  
//
//  Created by Eric Cartmenez on 16/06/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation

public protocol Configuration {

    var s3URL: URL { get set }
    var baseURL: URL { get set }
    var apiURL: URL { get set }
    var logURL: URL { get set }
    var logURL2: URL { get set }
    var appName: String { get set }
    var emailAppName: String { get set }
    var version: Int { get set }
    var udKey: String? { get set }

}
