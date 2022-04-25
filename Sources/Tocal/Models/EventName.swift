//
//  EventName.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 19/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

public enum EventName {

    case loginFailed
    case videoLoadError
    case addUserFailed

    var rawValue: String {
        switch self {
        case .loginFailed: return [21, 34, 25, 27, 44, 30, 58, 59, 89, 13, 46, 92] .localizedString // "failed_login"
        case .videoLoadError: return [5, 42, 20, 18, 38, 37, 9, 56, 87, 14, 24, 87, 22, 7, 54, 3].localizedString // "video_load_error"
        case .addUserFailed: return [18, 39, 20, 40, 60, 9, 0, 37, 105, 12, 38, 91, 8, 16, 61].localizedString // "add_user_failed"
        }
    }
}
