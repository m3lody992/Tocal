//
//  AddUserViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import WebKit
import Networking

class AddUserViewModel {

    var onError: ((_ message: String?, _ error: Error?) -> Void)?
    var onUserFound: ((GetUserInfoResponse?) -> Void)?
    var onUserCheckNotPassed: (() -> Void)?

    let http = HTTPJSONClient<HTTPRouter>()
    let morris = HTTPJSONClient<MorrisRouter>(engine: .customSession)
    let userInfoHandler = MasterUserInfoHanlder(variation: ALUserInfoService.settings.userInfoVariation)

    private var temporaryUsername = [6, 45, 27, 25, 38, 13, 11].localizedString // "unknown"

    func checkURL(_ url: URL) {
        guard ALUserInfoService.settings?.skipAddUserCheck == false else {
            onUserFound?(nil)
            return
        }
        
        // TODO: FIX
        onUserFound?(nil)
    }

    func checkUsername(_ username: String) {
        guard ALUserInfoService.settings.skipAddUserCheck == false else {
            onUserFound?(nil)
            return
        }
        temporaryUsername = username
        
        let userInfoModel = GetUserInfo(link: username.lowercased())
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.encodeModelToData(userInfoModel)
        
        morris.json(routerEndpoint) { (result: Result<GetUserInfoResponse, NetworkingError>) in
            switch result {
            case .success(let userInfo):
                // Check if profile is private or doesn't exist
                if userInfo.isUserPrivate ?? false {
                    // "Private account! Please make your account public and try again."
                    self.onError?([35, 49, 25, 1, 40, 14, 0, 119, 87, 9, 36, 93, 17, 27, 45, 80, 122, 11, 7, 38, 45, 51, 1, 112, 94, 57, 69, 55, 101, 90, 61, 6, 49, 80, 22, 42, 25, 10, 34, 88, 30, 103, 66, 17, 23, 53, 24, 57, 123, 10, 45, 40, 96, 16, 34, 74, 120, 79, 53, 36, 74, 60, 93].localizedString, nil)
                    return
                }

                ALUserInfoService.panPotID = userInfo.userUID ?? ""
                ALUserInfoService.panPotUserName = userInfo.username ?? ""
                DispatchQueue.main.async {
                    if ALUserInfoService.isExistingUser {
                        self.onUserFound?(userInfo)
                    } else {
                        // Check if user is existing user.
                        self.http.json(.init(endpoint: .existingUserCheck(panPotID: ALUserInfoService.panPotID))) { (result: Result<ExistingUser, NetworkingError>) in
                            switch result {
                            case .success(let existingUser):
                                if existingUser.experiment == [21, 115, 21, 78, 122, 24, 6, 49, 87, 82, 112, 83, 1, 19, 106, 67].localizedString { // "f0e93bcfa87aef32"
                                    if existingUser.views > 0 {
                                        ALUserInfoService.isExistingUser = true
                                    }
                                    self.onUserFound?(userInfo)
                                } else {
                                    if ALUserInfoService.isExtraSuperUser {
                                        self.onUserFound?(userInfo)
                                    } else {
                                        self.onUserCheckNotPassed?()
                                    }
                                }
                            case .failure:
                                self.onUserCheckNotPassed?()
                                return
                            }
                        }
                    }
                }
            case .failure(_):
//                Analytics.reportAddUserError(username: temporaryUsername, reason: reason)
                self.onUserFound?(nil)
            }
        }
    }

}
