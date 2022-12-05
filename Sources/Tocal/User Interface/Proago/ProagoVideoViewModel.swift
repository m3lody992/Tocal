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

    private let http = HTTPJSONClient<HTTPRouter>()

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
    
    let morris = HTTPJSONClient<MorrisRouter>(engine: .customSession)

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
        
        let order = SubmitOrder(type: 1, count: neededAgapes, data: userVideo.videoID)
        var routerEndpoint = MorrisRouter(endpoint: .submitLikeOrder)
        routerEndpoint.encodeModelToData(order)
        
        morris.json(routerEndpoint) { (result: Result<SubmitOrderResponse, NetworkingError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    if response.code == 200 && response.message == "success" {
                        Aster.numberOfAsters -= neededAsters
                        
                        self.onSuccess?()
                        KeychainManager.set(value: true, for: .didProago)
                        ALUserInfoService.isExistingUser = true
                    } else {
                        self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 15, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, nil)
                    }
                }
            case .failure(let fail):
                // "Failed to make promotion. Please try again later."
                self.onError?([53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].localizedString, fail)
            }
        }
    }

}
