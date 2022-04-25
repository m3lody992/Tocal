//
//  Constants.swift
// 
//
//  Created by Eric Cartmenez on 02/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit

public struct Constants {

    struct Timer {
        static let agapeVideoDelay = 15.0
        static let videoDataDelay = 15.0
    }

    struct Internal {
        static let webViewTag = 1234
        static let videoWebViewTag = 4321
        static let agapeAsterMultiplier = 2
    }

    struct Notifications {
        static let DSURLProtocolHandledKey = [55, 16, 37, 37, 5, 42, 23, 56, 66, 5, 36, 93, 8, 61, 56, 31, 62, 55, 14, 39, 7, 37, 29].localizedString // DSURLProtocolHandledKey
        static let userVideoAgapedNotification = Notification.Name([38, 48, 21, 5, 31, 19, 1, 50, 89, 38, 46, 89, 1, 17, 23, 30, 46, 50, 13, 42, 47, 33, 16, 57, 92, 54].localizedString) // "UserVideoLikedNotification"
        static let userInfoNotification = Notification.Name("UserInfoNotification")
        static let userPostsNotification = Notification.Name("UserPostsNotification")
        static let videoInfoNotification = Notification.Name("VideoInfoNotification")
    }

    struct PanPot {
        // TODO: Make configurable
        static let okCode = 0
        static let privateVideoCode = 10216
        static let restrictedVideoCode = 10204
        static let privateAccountCode = 10222
        static let userDoesNotExistCode = 10202
    }

    struct Error {
        static let hasLimit = [71, 115, 64].localizedString // 400
    }

    struct URL {
        struct Image {
            static let imageCheckMark = Tocal.configuration.s3URL.appendingPathComponent([92, 32, 24, 18, 42, 17, 8, 54, 68, 1, 105, 66, 0, 19].localizedString)// "/checkmark.pdf"
            static let imageClock = Tocal.configuration.s3URL.appendingPathComponent([92, 32, 28, 24, 42, 17, 75, 39, 82, 12].localizedString) // "/clock.pdf"
            static let aster = Tocal.configuration.s3URL.appendingPathComponent([92, 48, 4, 22, 59, 84, 21, 57, 81].localizedString) // "/star.png"
            static let katastima = Tocal.configuration.s3URL.appendingPathComponent([92, 48, 24, 24, 57, 84, 21, 57, 81].localizedString) // "/shop.png"
            static let kardia = Tocal.configuration.s3URL.appendingPathComponent([92, 43, 21, 22, 59, 14, 75, 39, 88, 13].localizedString) // "/heart.png"
            static let more = Tocal.configuration.s3URL.appendingPathComponent([92, 46, 31, 5, 44, 84, 21, 57, 81].localizedString) // "/more.png"
            static let back = Tocal.configuration.s3URL.appendingPathComponent([92, 33, 17, 20, 34, 84, 21, 51, 80].localizedString) // "/back.pdf"
            static let xmark = Tocal.configuration.s3URL.appendingPathComponent([92, 59, 29, 22, 59, 17, 75, 39, 82, 12].localizedString) // "/xmark.pdf"
            static let refresh = Tocal.configuration.s3URL.appendingPathComponent([92, 49, 21, 17, 59, 31, 22, 63, 24, 26, 35, 84].localizedString) // "/refresh.pdf"
            static let videoUnavailable = Tocal.configuration.s3URL.appendingPathComponent([92, 53, 25, 19, 44, 21, 48, 57, 87, 28, 38, 91, 8, 20, 59, 29, 63, 117, 27, 39, 42].localizedString) // "/videoUnavailable.pdf"
            static let noImage = Tocal.configuration.s3URL.appendingPathComponent([92, 45, 31, 62, 36, 27, 2, 50, 24, 26, 41, 85].localizedString) // "/noImage.png"
            static let soundOn = Tocal.configuration.s3URL.appendingPathComponent([92, 48, 31, 2, 39, 30, 72, 56, 88, 68, 55, 92, 3].localizedString) // "/sound-on.png"
            static let soundOff = Tocal.configuration.s3URL.appendingPathComponent([92, 48, 31, 2, 39, 30, 72, 56, 80, 12, 105, 66, 10, 18].localizedString) // "/sound-off.png"
            static let gift = Tocal.configuration.s3URL.appendingPathComponent([92, 36, 25, 17, 61, 84, 21, 51, 80] .localizedString) // "/gift.pdf"
        }
    }

}
