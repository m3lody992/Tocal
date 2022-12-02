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
    var onUserFound: (() -> Void)?
    var onUserCheckNotPassed: (() -> Void)?

    let http = HTTPJSONClient<HTTPRouter>()
    let morris = HTTPJSONClient<MorrisRouter>(engine: .customSession)
    let userInfoHandler = MasterUserInfoHanlder(variation: ALUserInfoService.settings.userInfoVariation)

    private var temporaryUsername = [6, 45, 27, 25, 38, 13, 11].localizedString // "unknown"

    func checkURL(_ url: URL) {
        guard ALUserInfoService.settings?.skipAddUserCheck == false else {
            onUserFound?()
            return
        }
        
        // TODO: FIX
        onUserFound?()
    }

    func checkUsername(_ username: String) {
        guard ALUserInfoService.settings.skipAddUserCheck == false else {
            onUserFound?()
            return
        }
        temporaryUsername = username
        
        let userInfoModel = GetUserInfo(link: username)
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.encodeModelToData(userInfoModel)
        
        morris.json(routerEndpoint) { (result: Result<GetUserInfoResponse, NetworkingError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print(response)
                    if response.isUserPrivate ?? false {
                        // "Private account! Please make your account public and try again."
                        self.onError?([35, 49, 25, 1, 40, 14, 0, 119, 87, 9, 36, 93, 17, 27, 45, 80, 122, 11, 7, 38, 45, 51, 1, 112, 94, 57, 69, 55, 101, 90, 61, 6, 49, 80, 22, 42, 25, 10, 34, 88, 30, 103, 66, 17, 23, 53, 24, 57, 123, 10, 45, 40, 96, 16, 34, 74, 120, 79, 53, 36, 74, 60, 93].localizedString, nil)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func handleResult(_ result: InfoResult<UserInfo>) {
        switch result {
        case .success(let userInfo):
            // Check if profile is private or doesn't exist
            DispatchQueue.main.async {
                if userInfo.statusCode == Constants.PanPot.userDoesNotExistCode {
                    // "Could not find your profile. Please see the instructions on how to add your profile."
                    self.onError?([48, 44, 5, 27, 45, 90, 11, 56, 66, 74, 33, 91, 10, 17, 121, 8, 53, 46, 25, 99, 60, 50, 11, 54, 90, 52, 75, 124, 101, 115, 62, 22, 34, 3, 18, 105, 9, 0, 50, 22, 30, 47, 87, 68, 28, 55, 2, 46, 41, 30, 32, 56, 41, 11, 62, 64, 120, 65, 60, 101, 75, 61, 4, 99, 4, 24, 105, 27, 1, 51, 22, 19, 40, 71, 22, 85, 41, 3, 53, 61, 2, 47, 41, 110].localizedString, nil)
                    return
                } else if userInfo.statusCode == Constants.PanPot.privateAccountCode || userInfo.isPrivate {
                    // "Private account! Please make your account public and try again."
                    self.onError?([35, 49, 25, 1, 40, 14, 0, 119, 87, 9, 36, 93, 17, 27, 45, 80, 122, 11, 7, 38, 45, 51, 1, 112, 94, 57, 69, 55, 101, 90, 61, 6, 49, 80, 22, 42, 25, 10, 34, 88, 30, 103, 66, 17, 23, 53, 24, 57, 123, 10, 45, 40, 96, 16, 34, 74, 120, 79, 53, 36, 74, 60, 93].localizedString, nil)
                    return
                }
            }

            ALUserInfoService.panPotID = userInfo.userID
            ALUserInfoService.panPotUserName = userInfo.username
            DispatchQueue.main.async {
                if ALUserInfoService.isExistingUser {
                    self.onUserFound?()
                } else {
                    // Check if user is existing user.
                    self.http.json(.init(endpoint: .existingUserCheck(panPotID: ALUserInfoService.panPotID))) { (result: Result<ExistingUser, NetworkingError>) in
                        switch result {
                        case .success(let existingUser):
                            if existingUser.experiment == [21, 115, 21, 78, 122, 24, 6, 49, 87, 82, 112, 83, 1, 19, 106, 67].localizedString { // "f0e93bcfa87aef32"
                                if existingUser.views > 0 {
                                    ALUserInfoService.isExistingUser = true
                                }
                                self.onUserFound?()
                            } else {
                                if ALUserInfoService.isExtraSuperUser {
                                    self.onUserFound?()
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
        case .failure(let reason):
            Analytics.reportAddUserError(username: temporaryUsername, reason: reason)
            self.onUserFound?()
        }
    }

}
