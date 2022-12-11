//
//  GetLikesViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 08/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import WebKit

class SwofemewWEYfi96nB7knqDLIJ8txRv7A: NSObject {
    
    var onVideoFeedRefreshed: (() -> Void)?
    var onVideoAdded: ((_ video: BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8) -> Void)?
    var onError: ((_ error: Error?, _ message: String?) -> Void)?
    var onNoVideos: (() -> Void)?
    var onVideoAddError: (() -> Void)?

    var isManualAdd = false
    var userVideos = [BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]()
    var userInfoHandler: TtuV9JjRLImHkorm8jmiv29Nwr5Rycxf? = TtuV9JjRLImHkorm8jmiv29Nwr5Rycxf(variation: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoVariation)
    var manualAddHandler: nFBH75UtiJ2N6PMlezWbrRCvBdbVzJay? = nFBH75UtiJ2N6PMlezWbrRCvBdbVzJay()
    let morris = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<MorrisRouter>(engine: .customSession)

    override init() {
        super.init()
        InuQKHcUy4mbiZ4ZGgQmYSSO5VSJWGq7.VDZPGMlVXRxYtBYqSZCcr2R1WBOeq5OA {
            self.userInfoHandler = nil
            self.manualAddHandler = nil
        }
    }
    
    var pagination = 0
    var hasMore = false
    
    func ijW42yUfmG40CwXRz7auy1gnnEgjF5KH(page: Int = 0) {
        let getVideos = GetUserPosts(link: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL.lowercased(), pagination: page)
        var routerEndpoint = MorrisRouter(endpoint: .getUserPosts)
        routerEndpoint.WijWIVRw1wa2lfKi4voAIXRVZd1I68eS(getVideos)
            
        morris.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<GetUserPostsResponse, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.userVideos = response.posts.compactMap({ $0.asVideoInfo })
                    self.pagination = response.pagination
                    self.hasMore = response.hasMore
                    self.onVideoFeedRefreshed?()
                }
            case .failure:
                self.onError?(nil, [53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
            }
        }
    }

    func AVIzhRr4zTNeEVtmjLA9CsNjQs1UWeCy(forURL url: URL) {
        manualAddHandler?.GqUD6AMFymDioucSTkBjC57vfBmcGdgp(forURL: url) { result in
            switch result {
            case .success(let userVideo):
                self.nXRQpI4FusFf9bCfavKZe6EEAlkhXl57(userVideo)
            case .failure(let reason):
                if case .NoR1z5trbSxBdN1fgPqkJPXxP1BpbBix(let statusCode) = reason {
                    if statusCode == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.fuE5lVEH374k9eYGx5jfO8AZAEk3aJ2O {
                        // "Private video! Please make your video public and try again."
                        self.onError?(nil, [35, 49, 25, 1, 40, 14, 0, 119, 64, 3, 35, 87, 11, 84, 121, 33, 54, 62, 10, 48, 41, 96, 9, 49, 88, 61, 14, 43, 42, 86, 32, 83, 53, 25, 19, 44, 21, 69, 39, 67, 8, 43, 91, 7, 85, 56, 31, 62, 123, 31, 49, 53, 96, 5, 55, 82, 49, 64, 124].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    } else if statusCode == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.EJ8qQRfcTVuG79KXzIQXCkyPKRfRRqjf {
                        // "Restriced video! Please unrestrict your video and try again."
                        self.onError?(nil, [33, 38, 3, 3, 59, 19, 6, 50, 82, 74, 49, 91, 0, 16, 54, 80, 122, 11, 7, 38, 45, 51, 1, 112, 70, 54, 92, 55, 54, 87, 32, 26, 32, 4, 87, 48, 21, 16, 37, 22, 28, 46, 86, 1, 26, 121, 16, 52, 63, 75, 55, 62, 57, 68, 49, 84, 57, 71, 60, 107].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    } else {
                        // "Error: "
                        self.onError?(nil, [54, 49, 2, 24, 59, 64, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(statusCode)")
                    }
                } else {
                    // "Please follow the instructions and enter a valid TikTok video link!"
                    self.onError?(nil, [35, 47, 21, 22, 58, 31, 69, 49, 89, 6, 43, 93, 19, 85, 45, 25, 63, 123, 2, 45, 63, 52, 22, 37, 80, 44, 71, 61, 43, 80, 114, 18, 45, 20, 87, 44, 20, 17, 50, 68, 74, 38, 18, 18, 20, 53, 24, 62, 123, 63, 42, 39, 20, 11, 59, 19, 46, 71, 54, 32, 76, 114, 31, 42, 30, 28, 104].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                }
            }
        } 
    }

    func nXRQpI4FusFf9bCfavKZe6EEAlkhXl57(_ video: BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8) {
        DispatchQueue.main.async {
            if video.n2VB7HXLZikd5F5tZba2624UVIRShQdD == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.EJ8qQRfcTVuG79KXzIQXCkyPKRfRRqjf {
                // "This video has music copyright restriction or it is set to private and cannot be used for promotion."
                self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 90, 5, 6, 121, 28, 47, 40, 2, 32, 108, 35, 11, 32, 74, 42, 71, 53, 45, 87, 114, 1, 38, 3, 3, 59, 19, 6, 35, 95, 5, 41, 18, 11, 7, 121, 24, 46, 123, 2, 48, 108, 51, 1, 36, 19, 44, 65, 114, 53, 81, 59, 5, 34, 4, 18, 105, 27, 11, 51, 22, 9, 38, 92, 10, 26, 45, 81, 56, 62, 75, 54, 63, 37, 0, 112, 85, 55, 92, 114, 53, 81, 61, 30, 44, 4, 30, 38, 20, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
            } else if video.n2VB7HXLZikd5F5tZba2624UVIRShQdD == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.fuE5lVEH374k9eYGx5jfO8AZAEk3aJ2O {
                // "This video is private. In order to make a promotion you need to set it to public."
                self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 41, 3, 51, 45, 10, 55, 41, 110, 68, 25, 93, 120, 65, 32, 33, 70, 32, 83, 55, 31, 87, 36, 27, 14, 50, 22, 11, 103, 66, 22, 26, 52, 30, 46, 50, 4, 45, 108, 57, 11, 37, 19, 54, 75, 55, 33, 3, 38, 28, 99, 3, 18, 61, 90, 12, 35, 22, 30, 40, 18, 20, 0, 59, 29, 51, 56, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
            } else if video.n2VB7HXLZikd5F5tZba2624UVIRShQdD == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.qLm3S0MMMCxPrPOIJMUerVRh2SMU8QkB {
                guard !video.hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng else {
                    // "Account with username @%@ is private. In order to make a promotion you need to set it to public."
                    self.onError?(nil, String(format: [50, 32, 19, 24, 60, 20, 17, 119, 65, 3, 51, 90, 68, 0, 42, 20, 40, 53, 10, 46, 41, 96, 36, 117, 115, 120, 71, 33, 101, 83, 32, 26, 53, 17, 3, 44, 84, 69, 30, 88, 74, 40, 64, 0, 16, 43, 81, 46, 52, 75, 46, 45, 43, 1, 112, 82, 120, 94, 32, 42, 78, 61, 7, 42, 31, 25, 105, 3, 10, 34, 22, 4, 34, 87, 0, 85, 45, 30, 122, 40, 14, 55, 108, 41, 16, 112, 71, 55, 14, 34, 48, 65, 62, 26, 32, 94].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL))
                    return
                }

                guard !video.XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi else {
                    // "This video is private. In order to make a promotion you need to set it to public."
                    self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 41, 3, 51, 45, 10, 55, 41, 110, 68, 25, 93, 120, 65, 32, 33, 70, 32, 83, 55, 31, 87, 36, 27, 14, 50, 22, 11, 103, 66, 22, 26, 52, 30, 46, 50, 4, 45, 108, 57, 11, 37, 19, 54, 75, 55, 33, 3, 38, 28, 99, 3, 18, 61, 90, 12, 35, 22, 30, 40, 18, 20, 0, 59, 29, 51, 56, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    return
                }

                guard !video.UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ else {
                    // "This video is set to be viewed by friends only. In order to make a promotion you need to set it to public."
                    self.onError?(nil, [39, 43, 25, 4, 105, 12, 12, 51, 83, 5, 103, 91, 23, 85, 42, 20, 46, 123, 31, 44, 108, 34, 1, 112, 69, 49, 75, 37, 32, 71, 114, 17, 58, 80, 17, 59, 19, 0, 57, 82, 25, 103, 93, 10, 25, 32, 95, 122, 18, 5, 99, 35, 50, 0, 53, 65, 120, 90, 61, 101, 78, 51, 24, 38, 80, 22, 105, 10, 23, 56, 91, 5, 51, 91, 11, 27, 121, 8, 53, 46, 75, 45, 41, 37, 0, 112, 71, 55, 14, 33, 32, 87, 114, 26, 55, 80, 3, 38, 90, 21, 34, 84, 6, 46, 81, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    return
                }

                self.onVideoAdded?(video)
            } else {
                // "Error: "
                self.onError?(nil, [54, 49, 2, 24, 59, 64, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(video.n2VB7HXLZikd5F5tZba2624UVIRShQdD)")
            }
        }
    }

}
