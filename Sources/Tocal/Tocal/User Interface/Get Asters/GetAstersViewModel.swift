//
//  GetAstersViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import AVFoundation
//import InfoServices
//import Networking

class lixN4JHo65MtW4cNqL9QLPK8XBNM0T28: NSObject {

    private let http = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z>()

    private var presentingItem: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN?
    private var agapedItem: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN?
    private var queue: [dsvRBa8tNAqERz9MljnQygVZ3stcR9RN]?
    private var agapedItems = [dsvRBa8tNAqERz9MljnQygVZ3stcR9RN]()

    var onSuccessfulAgape: (() -> Void)?
    var onChangeAgapeMode: (() -> Void)?
    var onAgapeRemoved: (() -> Void)?
    var onVideosRefreshed: (() -> Void)?
    var onNewVideoLoaded: ((_ video: AsP0l3d30PxTB9rpUbzyFZNZqmVr6bTq) -> Void)?

    var onHideLoader: (() -> Void)?
    var onAgapeNotRegistered: (() -> Void)?

    var onNoNewVideos: (() -> Void)?
    var onError: ((_ message: String, _ autoDismiss: Bool) -> Void)?
    var forceLoader: (() -> Void)?

    private lazy var userInfoHandler: TtuV9JjRLImHkorm8jmiv29Nwr5Rycxf? = TtuV9JjRLImHkorm8jmiv29Nwr5Rycxf(variation: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoVariation)
    private lazy var videoInfoAgapeHandler: goz2eh5lNNVGnb5ouZYf0wDo6qdRpFkO? = goz2eh5lNNVGnb5ouZYf0wDo6qdRpFkO(
        videoInfoVariations: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.videoInfoVariation,
        agapeVariations: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeVariation)
    private var appStateHanlder: PPYYkBfJ6RobosDg0q4UxZd0QsqA6qBv? = .init()
    
    var loaderWebView: zwsx8v50MbupiZIeoimtuMXh1ohsBX28? {
        videoInfoAgapeHandler?.M7QabMqginIGhBwF18iMdqNztLO138fD.webView
    }

    private var adFrequency = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.adFrequency
    var tapCount = 0
    var shouldShowAd: Bool {
        tapCount % adFrequency == 0
    }

    override init() {
        super.init()
        uuDupaojq2f67SJ6ybxRk6YbAQQWd0vI()
        InuQKHcUy4mbiZ4ZGgQmYSSO5VSJWGq7.VDZPGMlVXRxYtBYqSZCcr2R1WBOeq5OA {
            self.userInfoHandler = nil
            self.videoInfoAgapeHandler = nil
            self.appStateHanlder = nil
        }
    }

    private var isFetchInProgress = false
    private var didClickAgape = false

    var isPresentingItemFallbackItem: Bool {
        presentingItem?.adMeta == [53, 2, 60, 59, 11, 59, 38, 28].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG && OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.useFallback == true
    }

    private var noAgapeCount = 0

}

// MARK: - Likes functionality

extension lixN4JHo65MtW4cNqL9QLPK8XBNM0T28 {

    func SFuOjUqbp5pPYjd6T2JWVTnvZs2sgry7() {
        guard let presentingItem = presentingItem,
        agapedItems.contains(presentingItem) == false else {
            onHideLoader?()
            return
        }

        tapCount += 1

        if presentingItem.adMeta == [53, 2, 60, 59, 11, 59, 38, 28].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, // "FALLBACK"
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.useFallback {
            forceLoader?()
            DispatchQueue.main.asyncAfter(deadline: .now() + (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.fDelay)) {
                maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G += 1
                self.onSuccessfulAgape?()
                self.d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
            }
        } else if ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.SzZ7B6w7R2S5Ul31BrGct2Mv3PI6TzLY {
            videoInfoAgapeHandler?.rPBlaBRne4kvVMpjh3b9Y3bRLUxop4xj(item: presentingItem) { [self] result in
                switch result {
                case .success(let isAgaped):
                    
                    switch isAgaped {
                    case .HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb:
                        // Append star
                        maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G += 1

                        // Reset stuff
                        didClickAgape = false
                        agapedItem = nil
                        noAgapeCount = 0
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH = 0
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.goJSSpBUEROMTZdKmBWHfMxPk578BSVn = 0

                        // Append item to agapedItems and report success
                        agapedItems.append(presentingItem)
                        SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.nqPWdxOxbyZuJDqXI1suwzVoUEixx8KB(forQueueItem: presentingItem, source: .UAotBrW1MUg0I1eHuoRQOkvchwnzWSGQ)
                        DispatchQueue.main.async {
                            onSuccessfulAgape?()
                        }
                        d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                    case .fmbGGvWPuST4dFqWMCRUMeLFKvv3ruGZ:
                        onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 43, 91, 15, 16, 121, 5, 50, 62, 75, 53, 37, 36, 1, 63, 18].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, true) // "Unable to like the video!"
                        d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                    case .IFDA5J4QN4Ezw2nvCbFhnnTEO5bPCAk5:
                        onAgapeNotRegistered?() // We hide the loader and let the user like again.
                    }

                case .failure(let reason):
                    if case .t3dXwDLXv8ceZ8QPrI5IcjV7tHQL7sjJ = reason {
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.goJSSpBUEROMTZdKmBWHfMxPk578BSVn += 1
                    } else {
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH += 1
                    }

                    if ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.SzZ7B6w7R2S5Ul31BrGct2Mv3PI6TzLY == false {
                        self.onChangeAgapeMode?()
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq = .panPotApp
                    } else {
                        onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 43, 91, 15, 16, 121, 5, 50, 62, 75, 53, 37, 36, 1, 63, 18].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, true) // "Unable to like the video!"
                    }
                    SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: presentingItem, source: .UAotBrW1MUg0I1eHuoRQOkvchwnzWSGQ, reason: reason)
                    d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                }
            }
        } else {
            // Temporary set presentingItem as likedItem as we fetch a new item right after navigating out of the app.
            agapedItem = presentingItem
            agapedItems.append(presentingItem)
            // "https://m.tiktok.com/v/\(presentingItem.tikTokMediaID).html"
            guard let url = URL(string: [27, 55, 4, 7, 58, 64, 74, 120, 91, 68, 51, 91, 15, 1, 54, 26, 116, 56, 4, 46, 99, 54, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + presentingItem.adMediaId + [93, 43, 4, 26, 37].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) else { return }
            if UIApplication.shared.canOpenURL(url) {
                didClickAgape = true
                UIApplication.shared.open(url)
            } else {
                // "Unable to open TikTok app, please re-open both apps."
                self.onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 40, 66, 1, 27, 121, 37, 51, 48, 63, 44, 39, 96, 5, 32, 67, 116, 14, 34, 41, 70, 51, 0, 38, 80, 5, 44, 87, 10, 39, 83, 4, 103, 80, 11, 1, 49, 81, 59, 43, 27, 48, 98].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, false)
            }
            d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
        }

    }

}

// MARK: - TikTok app liking

extension lixN4JHo65MtW4cNqL9QLPK8XBNM0T28 {
    
    private func AdXjowrDTiLb8dfZVeErbpUPkfl7OyVK() {
        forceLoader?()
        switch OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.panPotAgapeCheck {
        case .api:
            D7dtIshZmwv121aNrdBybK0kGBcpSWDh() { [weak self] result in
                switch result {
                case .success(let isAgaped):
                    if isAgaped {
                        self?.FALRIgyclD2Ibne9WSIlFtHaTBieLNUh()
                    } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.automaticBackupPanPotAgapeCheck {
                        self?.userInfoHandler?.ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL) { result in
                            self?.rbxlunBHJQ31fCHD6FNivQvvQWMdOkgB(result: result)
                        }
                    } else {
                        self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason: .HBgNx8jJcqzJSIdAZBCrBRDYdS6702s6)
                    }
                case .failure(let reason):
                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.automaticBackupPanPotAgapeCheck {
                        self?.userInfoHandler?.ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL) { result in
                            self?.rbxlunBHJQ31fCHD6FNivQvvQWMdOkgB(result: result)
                        }
                    } else {
                        self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason: reason)
                    }
                }
            }
        case .classic:
            self.userInfoHandler?.ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL) { [weak self] result in
                switch result {
                case .success(let userInfo):
                    // If count didin't increase (which is a successful like)
                     if userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m > OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy {
                        // Successful like
                        self?.rbxlunBHJQ31fCHD6FNivQvvQWMdOkgB(result: result)
                    } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.automaticBackupPanPotAgapeCheck {
                        // Call backup
                        self?.D7dtIshZmwv121aNrdBybK0kGBcpSWDh() { result in
                            switch result {
                            case .success(let isAgaped):
                                isAgaped ? self?.FALRIgyclD2Ibne9WSIlFtHaTBieLNUh() : self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo()
                            case .failure(let reason):
                                self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason: reason)
                            }
                        }
                    } else {
                        self?.rbxlunBHJQ31fCHD6FNivQvvQWMdOkgB(result: result)
                    }
                case .failure(let reason):
                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.automaticBackupPanPotAgapeCheck {
                        self?.D7dtIshZmwv121aNrdBybK0kGBcpSWDh() { result in
                            switch result {
                            case .success(let isAgaped):
                                isAgaped ? self?.FALRIgyclD2Ibne9WSIlFtHaTBieLNUh() : self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo()
                            case .failure(let reason):
                                self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason: reason)
                            }
                        }
                    } else {
                        self?.HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason: reason)
                    }
                }
            }
        }
    }
    
    private func D7dtIshZmwv121aNrdBybK0kGBcpSWDh(completion: @escaping (InfoResult<Bool>) -> Void) {
        if let agapedItem = agapedItem {
            self.agapedItem = nil
            ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forItem: agapedItem) { result in
                switch result {
                case .success(let videoInfo):
                    if videoInfo.isAgaped {
                        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy += 1
                    }
                    completion(.success(videoInfo.WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU))
                case .failure(let reason):
                    completion(.failure(reason))
                }
            }
        } else {
            // "Oops, something went wrong. Please try again later."
            self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, false)
        }
    }
    
    func rbxlunBHJQ31fCHD6FNivQvvQWMdOkgB(result: InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) {
        guard let agapedItem = agapedItem else {
            onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, false)
            return
        }
        
        self.agapedItem = nil
        
        switch result {
        case .success(let userInfo):
            
            let finishPanPotAgape = { [weak self] in
                self?.didClickAgape = false
                self?.agapedItem = nil
            }

            if userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m == 0 {
                onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, false)
                SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9, reason: .RkZl4abyNClnY8lHutAHNUWaKbuarRGb)
            } else if userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m > OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy {
                FALRIgyclD2Ibne9WSIlFtHaTBieLNUh()
            } else if userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m == OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy {
                noAgapeCount += 1
                if !OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.hOE2G3TDOTL3ek6lUhKWpoSdJBIXqoZ7 || self.noAgapeCount > (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.failToleranceFactor) {
                    noAgapeCount = 0
                    onChangeAgapeMode?()
                } else {
                    onHideLoader?()
                }
                SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9, reason: .HBgNx8jJcqzJSIdAZBCrBRDYdS6702s6)
            } else if userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m < OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy {
                SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9, reason: .mAsRcuEAzFPcS4FYgacbZwqGrxMlHMOo)
                onAgapeRemoved?()
                if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.takeDrachme == true, (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy - userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m) > OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.takeDrachmeLimit {
                    maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G -= (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy - userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m)
                }
            }
            // Update our storage of agape count.
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.IvyNBxCjOswBW5VOWV8Q4KQAPO9qXgoy = userInfo.StdLH4czyirx3XMiDKsHErsflzOZA68m
            finishPanPotAgape()

        case .failure(let reason):
            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9, reason: reason)
        }
    }
    
    private func FALRIgyclD2Ibne9WSIlFtHaTBieLNUh() {
        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.hOE2G3TDOTL3ek6lUhKWpoSdJBIXqoZ7 = true
        maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G += 1
        self.noAgapeCount = 0
        self.didClickAgape = false
        self.onSuccessfulAgape?()
        if let agapedItem = self.agapedItem {
            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.nqPWdxOxbyZuJDqXI1suwzVoUEixx8KB(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9)
        }
        self.agapedItem = nil
    }
    
    private func HgGkGNKjZLONcTHFvoqYF5Hm9dpXXRDo(withReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7? = nil) {
        didClickAgape = false
        agapedItem = nil
        onChangeAgapeMode?()
        if let agapedItem = self.agapedItem {
            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ckYuj63Vw4DM4VVW2oRbMIU3VCmGzd4H(forQueueItem: agapedItem, source: .C0adiaNNC9DcBdmdlyQ0lGsBzfl6xRQ9, reason: reason ?? .HBgNx8jJcqzJSIdAZBCrBRDYdS6702s6)
        }
    }

    func uuDupaojq2f67SJ6ybxRk6YbAQQWd0vI() {
        appStateHanlder?.nThjORZ7mYD5nxmddBBVsmVwEITzJZAA { [weak self] in
            if self?.didClickAgape == true {
                self?.forceLoader?()

                self?.AdXjowrDTiLb8dfZVeErbpUPkfl7OyVK()
            }

            if Date().timeIntervalSince(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.xFYIahkRtyLfnuS33yZRr54ZCMuhDb8k) > 60 {
                self?.queue?.removeAll()
                self?.d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                self?.forceLoader?()
            }
        }

        appStateHanlder?.rtWUrBCTCQjfV0n8W49p3m27IXudSyo7 {
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.xFYIahkRtyLfnuS33yZRr54ZCMuhDb8k = Date()
        }

    }

}

// MARK: - Loading and Presenting functionality

extension lixN4JHo65MtW4cNqL9QLPK8XBNM0T28 {

    func d67nf1kLmKBBF3vUujbjsofTsdik8BTc() {
        ZckgR9F6J3s9D1Pe65G07pjEnpbuq9Ja { [self] item in
            guard let item = item else { return }

            if jxC52KbDvLHWd3x4cVL5Vde29PpjBqUs.mUfxpS9F6XUYMaHRCmSjv1RxGTEN7HrY {
                videoInfoAgapeHandler?.pHlUftfJbs0UC1dbtB3d206ZhosZgNBN(forItem: item) { result in
                    switch result {
                    case .success(let videoInfo):
                        // In case we get a status code other than 0 we report it to our backend and load next video.
                        if videoInfo.n2VB7HXLZikd5F5tZba2624UVIRShQdD != CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.qLm3S0MMMCxPrPOIJMUerVRh2SMU8QkB {
                            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ZQXyqSyPNrXUYKC0Ca0cr051RGybhcav(forQueueItem: item, statusCode: videoInfo.n2VB7HXLZikd5F5tZba2624UVIRShQdD)
                            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.skipUnavailableVideos == false {
                                return
                            } else {
                                d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                                return
                            }
                        }
                        
                        guard videoInfo.WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU == false else {
                            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ezp8Ot81XaSVA7TaJ0mRmTE8mF8gCqMG(eventName: .Y9MZeMTw0bvY45l0U8z1Pxg6mnoJWLbk, reason: .hSIoLx0wONlycGhLqNOBaNkAcP4W0ZRe)
                            d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                            return
                        }

                        DispatchQueue.main.async {
                            presentingItem = item
                            onNewVideoLoaded?(videoInfo)
                        }
                        jxC52KbDvLHWd3x4cVL5Vde29PpjBqUs.dpADqXbagQo1Qtz9nxhelaWjd7DNOXfU = 0
                        jxC52KbDvLHWd3x4cVL5Vde29PpjBqUs.PoeEkJvHyHOJSqF3iqTxCoaFFd6JklxQ = 0
                    case .failure(let reason):
                        // In case we have a http status code not in 200...299, we check the skip flag.
                        // In case flag is set to false we don't load the next video.
                        if case .xmTcHBAXjW6qF7RmoXgcShNcD1tYXeWw(let statusCode) = reason {
                            SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.ZQXyqSyPNrXUYKC0Ca0cr051RGybhcav(forQueueItem: item, statusCode: statusCode)
                            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.skipUnavailableVideos == false {
                                return
                            } else {
                                d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                                return
                            }
                        }

                        SAEXmfBNs1JAoCZgTAveDNlMOtiHo3au.tj3hnQnHfbJWdoG54Zhj53X2rwaorK8L(forQueueItem: item, reason: reason)

                        // Handle Fail reasons
                        if case .mQrGpyWHQnXybFRbSwvPW7GQKV2vU1KX = reason {
                            jxC52KbDvLHWd3x4cVL5Vde29PpjBqUs.PoeEkJvHyHOJSqF3iqTxCoaFFd6JklxQ += 1
                        } else {
                            jxC52KbDvLHWd3x4cVL5Vde29PpjBqUs.dpADqXbagQo1Qtz9nxhelaWjd7DNOXfU += 1
                        }
                        d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                    }
                }
            } else {
                videoInfoAgapeHandler?.YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item) { result in
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            presentingItem = item
                            onNewVideoLoaded?(item)
                        }
                    case .failure:
                        d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
                    }
                }
            }
        }
    }

    func ZckgR9F6J3s9D1Pe65G07pjEnpbuq9Ja(completion: @escaping (_ item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN?) -> Void) {
        guard !isFetchInProgress else {
            return
        }

        let popQueueItemAndReturn = { [weak self] in
            guard let count = self?.queue?.count, count > 0 else {
                self?.isFetchInProgress = false
                self?.onNoNewVideos?()
                self?.Dc33a58VXPsMTfrTnVYWCoD7oYigEsuP()
                return
            }
            let firstItem = self?.queue?.first
            self?.queue?.removeFirst()
            self?.isFetchInProgress = false
            DispatchQueue.main.async {
                completion(firstItem)
            }
        }

        if let queue = queue, !queue.isEmpty {
            popQueueItemAndReturn()
        } else {
            uQRFlSUkh8aQDeDGtbGtbt2tL9eikiy6 {
                popQueueItemAndReturn()
            }
        }
    }

    func uQRFlSUkh8aQDeDGtbGtbt2tL9eikiy6(completion: (() -> Void)? = nil) {
        isFetchInProgress = true
        http.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(.init(SAuL4WFDmxOLz6dtnXaIO9YYx3yhFuMq: .M7lfDTfcJ87XxqIuOkl8d97e9P5bii3J(panPotID: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa))) { (result: Result<qc1Nzf7rVDuqQ2BOifqOniNiAH4ICYrH, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let queueData):
                self.queue = queueData.data
                self.isFetchInProgress = false
                self.onVideosRefreshed?()
                completion?()
            case .failure:
                self.isFetchInProgress = false
                // "Can't fetch new videos. Please try again later."
                self.onError?([48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, false)
                completion?()
            }
        }
    }

    func Dc33a58VXPsMTfrTnVYWCoD7oYigEsuP() {
        if queue?.isEmpty == true {
            presentingItem = nil
        }
    }

}
