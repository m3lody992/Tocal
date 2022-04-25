//
//  AgapeReason.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 06/09/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

public enum FailReason: Error {

    // In App Likes errors
    case dictNotFound
    case statusCodeNotInDict
    case wrongAgapePath
    case statusCodeNotZero(statusCode: Int)
    case agapeNotZero(agape: Int)
    case agapeCountDidntIncrease

    case mediaIDNotMatching
    case itemDetailTimerTimeout
    case agapeEvalTimerTimeout
    case timerTimeout
    case pageLoadFailed
    case noVideoFeed
    case noUserInfo
    case cantFindProfile
    case responseStatusCodeNotOk(statusCode: Int)

    case userInfoWrongStatusPath

    case itemListPathNotFound
    case userVideoParsingFailed

    case agapeEvalFailed

    // Item detail errors
    case itemDetailDictNotFound
    case itemDetailWrongStatusPath

    // TikTok App errors
    case agapesEvalFailed
    case currentAgapesIsZero
    case agapeCountDecreased
    
    case alreadyAgaped

    case failed
    case jsEvalFailed(underlying: Error?)

    case webViewNil

    var rawValue: String {
        switch self {
        case .dictNotFound: return [23, 42, 19, 3, 32, 21, 11, 54, 68, 19, 24, 92, 11, 1, 6, 23, 53, 46, 5, 39].localizedString// "dictionary_not_found"
        case .statusCodeNotInDict: return [0, 55, 17, 3, 60, 9, 58, 52, 89, 14, 34, 109, 10, 26, 45, 46, 51, 53, 52, 49, 41, 51, 20, 63, 93, 43, 75, 13, 33, 74, 49, 7, 42, 31, 25, 40, 3].localizedString// "status_code_not_in_response_dictionay"
        case .wrongAgapePath: return [23, 42, 23, 16, 22, 19, 11, 52, 89, 24, 53, 87, 7, 1, 6, 1, 59, 47, 3].localizedString // "digg_incorrect_path"
        case .statusCodeNotZero(let statusCode): return [0, 55, 17, 3, 60, 9, 58, 52, 89, 14, 34, 109, 13, 6, 6].localizedString + "\(statusCode)" // "status_code_is_\(statusCode)"
        case .agapeNotZero(let agape): return [23, 42, 23, 16, 22, 19, 22, 8].localizedString + "\(agape)"// "digg_is_\(agape)"
        case .agapeCountDidntIncrease: return [23, 42, 23, 16, 22, 25, 10, 34, 88, 30, 24, 86, 13, 17, 55, 5, 5, 50, 5, 32, 62, 37, 5, 35, 86].localizedString // "digg_count_didnt_increase"

        case .mediaIDNotMatching: return [30, 38, 20, 30, 40, 37, 12, 51, 105, 4, 40, 70, 59, 24, 56, 5, 57, 51, 2, 45, 43].localizedString //"media_id_not_matching"

        case .itemDetailTimerTimeout: return [26, 55, 21, 26, 13, 31, 17, 54, 95, 6, 19, 91, 9, 16, 43, 37, 51, 54, 14, 44, 57, 52].localizedString // "itemDetailTimerTimeout"
        case .agapeEvalTimerTimeout: return [18, 36, 17, 7, 44, 63, 19, 54, 90, 62, 46, 95, 1, 7, 13, 24, 55, 62, 4, 54, 56].localizedString // "agapeEvalTimerTimeout"
        case .timerTimeout: return "timerTimeout"
        case .pageLoadFailed: return [3, 34, 23, 18, 22, 22, 10, 54, 82, 53, 33, 83, 13, 25, 60, 21].localizedString // "page_load_failed"
        case .noVideoFeed: return [29, 44, 47, 1, 32, 30, 0, 56, 105, 12, 34, 87, 0].localizedString // "no_video_feed"
        case .noUserInfo: return [29, 44, 47, 2, 58, 31, 23, 8, 95, 4, 33, 93].localizedString // "no_user_info"
        case .cantFindProfile: return [16, 34, 30, 3, 22, 28, 12, 57, 82, 53, 55, 64, 11, 19, 48, 29, 63].localizedString // "cant_find_profile"
        case .responseStatusCodeNotOk(let statusCode): return [1, 38, 3, 7, 38, 20, 22, 50, 105, 25, 51, 83, 16, 0, 42, 46, 57, 52, 15, 38, 19, 46, 11, 36, 108, 55, 69].localizedString + "_\(statusCode)"//"response_status_code_not_ok"

        case .userInfoWrongStatusPath: return [6, 48, 21, 5, 22, 19, 11, 49, 89, 53, 48, 64, 11, 27, 62, 46, 41, 47, 10, 55, 57, 51, 59, 32, 82, 44, 70].localizedString // "user_info_wrong_status_path"

        case .itemListPathNotFound: return [26, 55, 21, 26, 22, 22, 12, 36, 66, 53, 55, 83, 16, 29, 6, 31, 53, 47, 52, 37, 35, 53, 10, 52].localizedString // "item_list_path_not_found"
        case .userVideoParsingFailed: return [6, 48, 21, 5, 22, 12, 12, 51, 83, 5, 24, 66, 5, 7, 42, 24, 52, 60, 52, 37, 45, 41, 8, 53, 87].localizedString // "user_video_parsing_failed"

        case .agapeEvalFailed: return [18, 36, 17, 7, 44, 37, 0, 33, 87, 6, 24, 84, 5, 28, 53, 20, 62].localizedString // "agape_eval_failed"

        case .itemDetailDictNotFound: return [26, 55, 21, 26, 22, 30, 0, 35, 87, 3, 43, 109, 0, 28, 58, 5, 5, 53, 4, 55, 19, 38, 11, 37, 93, 60].localizedString // "item_detail_dict_not_found"
        case .itemDetailWrongStatusPath: return [26, 55, 21, 26, 22, 30, 0, 35, 87, 3, 43, 109, 19, 7, 54, 31, 61, 4, 24, 55, 45, 52, 17, 35, 108, 40, 79, 38, 45].localizedString // "item_detail_wrong_status_path"

        case .agapesEvalFailed: return [31, 42, 27, 18, 58, 37, 0, 33, 87, 6, 24, 84, 5, 28, 53, 20, 62].localizedString //"likes_eval_failed"
        case .currentAgapesIsZero: return [16, 54, 2, 5, 44, 20, 17, 8, 90, 3, 44, 87, 23, 42, 48, 2, 5, 33, 14, 49, 35].localizedString // "current_likes_is_zero"
        case .agapeCountDecreased: return [31, 42, 27, 18, 22, 25, 10, 34, 88, 30, 24, 86, 1, 22, 43, 20, 59, 40, 14, 39].localizedString // "like_count_decreased"
            
        case .alreadyAgaped: return "already_liked"

        case .failed: return [21, 34, 25, 27, 44, 30].localizedString
        case .jsEvalFailed(let underlying): return String(format: [25, 48, 47, 18, 63, 27, 9, 8, 80, 11, 46, 94, 1, 17, 6, 84, 26].localizedString,
                                                          (underlying?.localizedDescription ?? [6, 45, 27, 25, 38, 13, 11].localizedString).replacingOccurrences(of: " ", with: "_")) // "js_eval_failed_%@"  // "unknown"
        case .webViewNil: return "WebViewNil"
        }
    }
}
