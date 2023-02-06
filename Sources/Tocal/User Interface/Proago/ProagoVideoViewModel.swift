//
//  PromoteVideoViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 08/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import CryptoSwift
import WebKit
import DeviceTools
import Networking
import InfoServices

class ProagoVideoViewModel {

    private let http = HTTPJSONClient<HTTPRouter>(engine: .customSession)

    var onSuccess: (() -> Void)?
    var onError: ((_ message: String, _ error: Error?) -> Void)?
    var onPrivateProfileCheck: ((_ isPrivate: Bool) -> Void)?

    var neededAsters: Int {
        neededAgapes * Constants.Internal.agapeAsterMultiplier
    }
    var neededAgapes = 10
    var availableAgapes = [10, 20, 40, 60, 80, 100, 200, 300, 400, 500, 1000]

    var userVideo: VideoInfo?
    var thumbnailImage: UIImage?

    func proagoCurrentVideo() {
        guard let userVideo = userVideo else {
            // Failed to make promotion. Please try again later.
            self.onError?([53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].localizedString, nil)
            return
        }

        let seiraData = AddSeiraData(
            adThumbUrl: userVideo.adThumbUrl?.absoluteString ?? "",
//            adUrl: userVideo.videoURL,
            categoryName: ALUserInfoService.panPotUserName,
            nid: ALUserInfoService.panPotID,
            adMediaId: userVideo.videoID,
            apiToken: [].localizedString,
            targetImpressions: neededAgapes,
            adThumbData: thumbnailImage?.scalePreservingAspectRatio(
                targetSize: .init(width: ALUserInfoService.settings.resizeWidth,
                                  height: ALUserInfoService.settings.resizeHeight)).jpegData(compressionQuality: ALUserInfoService.settings.compressionQuality)?.base64EncodedString() ?? [].localizedString,
            adType: [5, 42, 20, 18, 38].localizedString, // video
            isValued: ALUserInfoService.isAgoraUser ? 1 : 0,
            lowestBid: userVideo.videoAgapes,
            currentImpressions: userVideo.videoViews,
            nonce: UUID().uuidString,
            h: Device.hasKorenina ? 1 : 0,
            c: Aster.numberOfAsters)
        
        guard let seira = Tocal.privacySettings.makeSsseigg(seiraData: seiraData, na: neededAgapes) else {
                // Failed to make promotion. Please try again later.
                self.onError?([53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].localizedString, nil)
                return
        }

        var endpoint = HTTPRouter(endpoint: .addPost)
        endpoint.encodeModelToData(seira)

        http.json(endpoint) { (result: Result<NetworkResponse, NetworkingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if response.status == [21, 54, 28, 27].localizedString { // full
                        // "Maximum number of likes has already been ordered for this video!"
                        self.onError?([62, 34, 8, 30, 36, 15, 8, 119, 88, 31, 42, 80, 1, 7, 121, 30, 60, 123, 7, 42, 39, 37, 23, 112, 91, 57, 93, 114, 36, 79, 32, 22, 34, 20, 14, 105, 24, 0, 50, 88, 74, 40, 64, 0, 16, 43, 20, 62, 123, 13, 44, 62, 96, 16, 56, 90, 43, 14, 36, 44, 71, 55, 28, 98].localizedString, nil)
                    } else if response.status == [28, 40].localizedString { // ok
                        Aster.numberOfAsters -= self.neededAsters
                        self.onSuccess?()
                    } else if response.status == [18, 47, 21, 5, 61].localizedString { // "alert"
                        guard let description = response.description else {
                            // "Oops, something went wrong! Please try again later."
                            self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 15, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, nil)
                            return
                        }
                        self.onError?(description, nil)
                    } else {
                        // "Oops, something went wrong! Please try again later."
                        self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 15, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, nil)
                        return
                    }
                case .failure(let error):
                    // "Failed to make promotion. Please try again later."
                    self.onError?([53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].localizedString, error)
                }
            }
        }
    }

}
