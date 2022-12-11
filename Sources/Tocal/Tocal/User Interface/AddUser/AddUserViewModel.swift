//
//  AddUserViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import WebKit
//import Networking

class z68MjvbClYKuz0IyruR7jmvcwURA5NBE {

    var cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV: ((_ message: String?, _ error: Error?) -> Void)?
    var o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu: ((GetUserInfoResponse?) -> Void)?
    var JWiY9338FvbMnLJojXuut2rKE4Wss5Gl: (() -> Void)?

    let sY5md4yqp1kulKje1Vv9Rg3l9LNVS1yS = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z>()
    let morris = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<MorrisRouter>(engine: .customSession)
    let SFxpEk3kIISBWVM6tU0GMoNXDaoRXVoF = TtuV9JjRLImHkorm8jmiv29Nwr5Rycxf(variation: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoVariation)

    private var xExzcQM1GpwjZTi1772LAR4mFFIYuGV9 = [6, 45, 27, 25, 38, 13, 11].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "unknown"

    func R4wiT2cnKDAkN6iT8rWgua3MytNYrT1v(_ url: URL) {
        guard OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9?.skipAddUserCheck == false else {
            o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(nil)
            return
        }
        
        // TODO: FIX
        o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(nil)
    }

    func nNdMFAJdtkpKHf0pfUiY8UK3InD4agsl(_ username: String) {
        guard OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.skipAddUserCheck == false else {
            o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(nil)
            return
        }
        xExzcQM1GpwjZTi1772LAR4mFFIYuGV9 = username
        
        let userInfoModel = GetUserInfo(link: username.lowercased())
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.WijWIVRw1wa2lfKi4voAIXRVZd1I68eS(userInfoModel)
        
        morris.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<GetUserInfoResponse, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let userInfo):
                if userInfo.code == 500 {
                    self.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(nil)
                    return
                }
                // Check if profile is private or doesn't exist
                if userInfo.isUserPrivate ?? false {
                    // "Private account! Please make your account public and try again."
                    self.cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV?([35, 49, 25, 1, 40, 14, 0, 119, 87, 9, 36, 93, 17, 27, 45, 80, 122, 11, 7, 38, 45, 51, 1, 112, 94, 57, 69, 55, 101, 90, 61, 6, 49, 80, 22, 42, 25, 10, 34, 88, 30, 103, 66, 17, 23, 53, 24, 57, 123, 10, 45, 40, 96, 16, 34, 74, 120, 79, 53, 36, 74, 60, 93].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, nil)
                    return
                }
                
                OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa = userInfo.userUID ?? ""
                OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL = userInfo.username ?? ""

                DispatchQueue.main.async {
                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua {
                        self.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(userInfo)
                    } else {
                        // Check if user is existing user.
                        self.sY5md4yqp1kulKje1Vv9Rg3l9LNVS1yS.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(.init(SAuL4WFDmxOLz6dtnXaIO9YYx3yhFuMq: .R8myqoZ3aNDIq9Ht98QFPTDtSRGmVNNQ(panPotID: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa))) { (result: Result<FpuDL47pSnHDcqqighZhyxwCvlD4DX38, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
                            switch result {
                            case .success(let existingUser):
                                if existingUser.experiment == [21, 115, 21, 78, 122, 24, 6, 49, 87, 82, 112, 83, 1, 19, 106, 67].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG { // "f0e93bcfa87aef32"
                                    if existingUser.views > 0 {
                                        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua = true
                                    }
                                    self.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(userInfo)
                                } else {
                                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.RilphweD7muYuJGQ7hAbYKdazAY1lUGk {
                                        self.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(userInfo)
                                    } else {
                                        self.JWiY9338FvbMnLJojXuut2rKE4Wss5Gl?()
                                    }
                                }
                            case .failure:
                                self.JWiY9338FvbMnLJojXuut2rKE4Wss5Gl?()
                                return
                            }
                        }
                    }
                }
            case .failure(_):
                //                Analytics.reportAddUserError(username: temporaryUsername, reason: reason)
                self.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu?(nil)
            }
        }
    }

}
