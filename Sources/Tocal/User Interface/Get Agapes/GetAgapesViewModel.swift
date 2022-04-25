//
//  GetLikesViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 08/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import WebKit

class GetAgapesViewModel: NSObject {
    
    var onVideoFeedRefreshed: (() -> Void)?
    var onVideoAdded: ((_ video: VideoInfo) -> Void)?
    var onError: ((_ error: Error?, _ message: String?) -> Void)?
    var onNoVideos: (() -> Void)?
    var onVideoAddError: (() -> Void)?

    var isManualAdd = false
    var userVideos = [VideoInfo]()
    var userInfoHandler: MasterUserInfoHanlder? = MasterUserInfoHanlder(variation: ALUserInfoService.settings.userInfoVariation)
    var manualAddHandler: ManualAddHandler? = ManualAddHandler()

    override init() {
        super.init()
        Session.onLogout {
            self.userInfoHandler = nil
            self.manualAddHandler = nil
        }
    }

    func loadUserVideos() {
        userInfoHandler?.getUserVideos(forUsername: ALUserInfoService.panPotUserName) { result in
            switch result {
            case .success(let userVideos):
                self.userVideos = userVideos
                DispatchQueue.main.async {
                    self.onVideoFeedRefreshed?()
                }
            case .failure(let reason):
                if case .noVideoFeed = reason {
                    // "Unable to load video feed. \nPlease tap on \"Add Manually\" button."
                    self.onError?(nil, [38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 43, 93, 5, 17, 121, 7, 51, 63, 14, 44, 108, 38, 1, 53, 87, 118, 14, 88, 21, 79, 55, 18, 48, 21, 87, 61, 27, 21, 119, 89, 4, 103, 16, 37, 17, 61, 81, 23, 58, 5, 54, 45, 44, 8, 41, 17, 120, 76, 39, 49, 87, 61, 29, 109].localizedString)
                } else {
                    // "We are having trouble loading your videos. Please try again later."
                    self.onError?(nil, [36, 38, 80, 22, 59, 31, 69, 63, 87, 28, 46, 92, 3, 85, 45, 3, 53, 46, 9, 47, 41, 96, 8, 63, 82, 60, 71, 60, 34, 3, 43, 28, 54, 2, 87, 63, 19, 1, 50, 89, 25, 105, 18, 52, 25, 60, 16, 41, 62, 75, 55, 62, 57, 68, 49, 84, 57, 71, 60, 101, 79, 51, 7, 38, 2, 89].localizedString)
                }
            }
        }
    }

    func addVideoManually(forURL url: URL) {
        manualAddHandler?.getVideoInfoManualAdd(forURL: url) { result in
            switch result {
            case .success(let userVideo):
                self.proagoVideo(userVideo)
            case .failure(let reason):
                if case .statusCodeNotZero(let statusCode) = reason {
                    if statusCode == Constants.PanPot.privateVideoCode {
                        // "Private video! Please make your video public and try again."
                        self.onError?(nil, [35, 49, 25, 1, 40, 14, 0, 119, 64, 3, 35, 87, 11, 84, 121, 33, 54, 62, 10, 48, 41, 96, 9, 49, 88, 61, 14, 43, 42, 86, 32, 83, 53, 25, 19, 44, 21, 69, 39, 67, 8, 43, 91, 7, 85, 56, 31, 62, 123, 31, 49, 53, 96, 5, 55, 82, 49, 64, 124].localizedString)
                    } else if statusCode == Constants.PanPot.restrictedVideoCode {
                        // "Restriced video! Please unrestrict your video and try again."
                        self.onError?(nil, [33, 38, 3, 3, 59, 19, 6, 50, 82, 74, 49, 91, 0, 16, 54, 80, 122, 11, 7, 38, 45, 51, 1, 112, 70, 54, 92, 55, 54, 87, 32, 26, 32, 4, 87, 48, 21, 16, 37, 22, 28, 46, 86, 1, 26, 121, 16, 52, 63, 75, 55, 62, 57, 68, 49, 84, 57, 71, 60, 107].localizedString)
                    } else {
                        // "Error: "
                        self.onError?(nil, [54, 49, 2, 24, 59, 64, 69].localizedString + "\(statusCode)")
                    }
                } else {
                    // "Please follow the instructions and enter a valid TikTok video link!"
                    self.onError?(nil, [35, 47, 21, 22, 58, 31, 69, 49, 89, 6, 43, 93, 19, 85, 45, 25, 63, 123, 2, 45, 63, 52, 22, 37, 80, 44, 71, 61, 43, 80, 114, 18, 45, 20, 87, 44, 20, 17, 50, 68, 74, 38, 18, 18, 20, 53, 24, 62, 123, 63, 42, 39, 20, 11, 59, 19, 46, 71, 54, 32, 76, 114, 31, 42, 30, 28, 104].localizedString)
                }
            }
        } 
    }

    func proagoVideo(_ video: VideoInfo) {
        DispatchQueue.main.async {
            if video.statusCode == Constants.PanPot.restrictedVideoCode {
                // "This video has music copyright restriction or it is set to private and cannot be used for promotion."
                self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 90, 5, 6, 121, 28, 47, 40, 2, 32, 108, 35, 11, 32, 74, 42, 71, 53, 45, 87, 114, 1, 38, 3, 3, 59, 19, 6, 35, 95, 5, 41, 18, 11, 7, 121, 24, 46, 123, 2, 48, 108, 51, 1, 36, 19, 44, 65, 114, 53, 81, 59, 5, 34, 4, 18, 105, 27, 11, 51, 22, 9, 38, 92, 10, 26, 45, 81, 56, 62, 75, 54, 63, 37, 0, 112, 85, 55, 92, 114, 53, 81, 61, 30, 44, 4, 30, 38, 20, 75].localizedString)
            } else if video.statusCode == Constants.PanPot.privateVideoCode {
                // "This video is private. In order to make a promotion you need to set it to public."
                self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 41, 3, 51, 45, 10, 55, 41, 110, 68, 25, 93, 120, 65, 32, 33, 70, 32, 83, 55, 31, 87, 36, 27, 14, 50, 22, 11, 103, 66, 22, 26, 52, 30, 46, 50, 4, 45, 108, 57, 11, 37, 19, 54, 75, 55, 33, 3, 38, 28, 99, 3, 18, 61, 90, 12, 35, 22, 30, 40, 18, 20, 0, 59, 29, 51, 56, 69].localizedString)
            } else if video.statusCode == Constants.PanPot.okCode {
                guard !video.isAccountPrivate else {
                    // "Account with username @%@ is private. In order to make a promotion you need to set it to public."
                    self.onError?(nil, String(format: [50, 32, 19, 24, 60, 20, 17, 119, 65, 3, 51, 90, 68, 0, 42, 20, 40, 53, 10, 46, 41, 96, 36, 117, 115, 120, 71, 33, 101, 83, 32, 26, 53, 17, 3, 44, 84, 69, 30, 88, 74, 40, 64, 0, 16, 43, 81, 46, 52, 75, 46, 45, 43, 1, 112, 82, 120, 94, 32, 42, 78, 61, 7, 42, 31, 25, 105, 3, 10, 34, 22, 4, 34, 87, 0, 85, 45, 30, 122, 40, 14, 55, 108, 41, 16, 112, 71, 55, 14, 34, 48, 65, 62, 26, 32, 94].localizedString, ALUserInfoService.panPotUserName))
                    return
                }

                guard !video.isPrivate else {
                    // "This video is private. In order to make a promotion you need to set it to public."
                    self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 41, 3, 51, 45, 10, 55, 41, 110, 68, 25, 93, 120, 65, 32, 33, 70, 32, 83, 55, 31, 87, 36, 27, 14, 50, 22, 11, 103, 66, 22, 26, 52, 30, 46, 50, 4, 45, 108, 57, 11, 37, 19, 54, 75, 55, 33, 3, 38, 28, 99, 3, 18, 61, 90, 12, 35, 22, 30, 40, 18, 20, 0, 59, 29, 51, 56, 69].localizedString)
                    return
                }

                guard !video.isForFilos else {
                    // "This video is set to be viewed by friends only. In order to make a promotion you need to set it to public."
                    self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 42, 20, 46, 123, 31, 44, 108, 34, 1, 112, 69, 49, 75, 37, 32, 71, 114, 17, 58, 80, 17, 59, 19, 0, 57, 82, 25, 103, 93, 10, 25, 32, 95, 122, 18, 5, 99, 35, 50, 0, 53, 65, 120, 90, 61, 101, 78, 51, 24, 38, 80, 22, 105, 10, 23, 56, 91, 5, 51, 91, 11, 27, 121, 8, 53, 46, 75, 45, 41, 37, 0, 112, 71, 55, 14, 33, 32, 87, 114, 26, 55, 80, 3, 38, 90, 21, 34, 84, 6, 46, 81, 74].localizedString)
                    return
                }

                self.onVideoAdded?(video)
            } else {
                // "Error: "
                self.onError?(nil, [54, 49, 2, 24, 59, 64, 69].localizedString + "\(video.statusCode)")
            }
        }
    }

}
