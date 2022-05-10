//
//  MasterVideoInfoAgapeHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 16/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import WebKit

protocol x1ZVxZA73ncdFoB2DdRKQ1Hhw1n3SuRd {
    func t9laEJaznhnkalYxCObre1QVOKm7NKjo(fromItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, usingWebViewHandler loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void)
}

protocol ze2N5a2YfnDH4j6VNswuEGs5JdCX4vQ4 {
    func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName username: String, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void)
    func qzqHVHhWvgbyg1kiJ9GG8LOK7J6D40Tv(forUsername username: String, completion: @escaping (InfoResult<[BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]>) -> Void)
}

enum YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm: String, Codable {
    case api
    case dsp
    case js

    var J3yZz8CNI7JUsMSy4cUY7m781JmygT9t: N1mJTknBwOXZJWLVLefCo7jKdG8EllRP {
        switch self {
        case .api: return ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl()
        case .dsp: return zmIaEvMMP7djrD2zlZYXojrttBLUFItA()
        case .js: return alnxOwOArtOfkIE3POjkfnGJQUNDxAQ4()
        }
    }
    
    var SFxpEk3kIISBWVM6tU0GMoNXDaoRXVoF: ze2N5a2YfnDH4j6VNswuEGs5JdCX4vQ4 {
        switch self {
        case .api: return li2GEEf6B8jZtdjIoTygldxWxZMAlJrQ()
        case .dsp: return JjkoiPPPhB7kObo5AuTuzDjbhSvOkPlF()
        case .js: return S5TQWgsS9zOwyPvTRiQS9Awq3vbHKAnn()
        }
    }

    var bYWsTZCjPng3uazQeZICdAtzA2dY7Tq6: x1ZVxZA73ncdFoB2DdRKQ1Hhw1n3SuRd {
        switch self {
        case .api: return xS9M6SD3fBld8DEVlJpJwGMO3BPxsHTk()
        case .dsp: return frwmG60Fueg2vqXJJCQyZz693NxNoj6D()
        case .js: return oxaNcrlqp0ZGRnW2KhUIEf5DJvAqVFZ0()
        }
    }
}


class goz2eh5lNNVGnb5ouZYf0wDo6qdRpFkO {

    private (set) var M7QabMqginIGhBwF18iMdqNztLO138fD = d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH()
    private var yaQcoTlxm4TbhZtydVvnQ2IhAcuSI0X0: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm
    private var WH1HZrHlE6SaVD1bXNnzDPapmcIDrsu7: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm

    init(videoInfoVariations: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm, agapeVariations: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm) {
        self.yaQcoTlxm4TbhZtydVvnQ2IhAcuSI0X0 = videoInfoVariations
        self.WH1HZrHlE6SaVD1bXNnzDPapmcIDrsu7 = agapeVariations
    }

    func pHlUftfJbs0UC1dbtB3d206ZhosZgNBN(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        yaQcoTlxm4TbhZtydVvnQ2IhAcuSI0X0.J3yZz8CNI7JUsMSy4cUY7m781JmygT9t.aeOwQnMvnwy4N4EidYEHLJYJ58tBIyqS(forItem: item, usingLoader: &self.M7QabMqginIGhBwF18iMdqNztLO138fD) { result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    completion(.success(info))
                }
                
            case .failure(let reason):
                DispatchQueue.main.async {
                    completion(.failure(reason))
                }
            }
        }
    }
    
    func YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        M7QabMqginIGhBwF18iMdqNztLO138fD.YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item, completion: completion)
    }
    
    func rPBlaBRne4kvVMpjh3b9Y3bRLUxop4xj(item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, completion: @escaping (InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void) {
        // If we don't have the correct video already loaded we load it.
        guard let urlString = M7QabMqginIGhBwF18iMdqNztLO138fD.loadedURL?.absoluteString, urlString.contains(item.adMediaId) else {
            M7QabMqginIGhBwF18iMdqNztLO138fD.YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item) { [self] result in
                switch result {
                case .success:
                    // Like the video
                    WH1HZrHlE6SaVD1bXNnzDPapmcIDrsu7.bYWsTZCjPng3uazQeZICdAtzA2dY7Tq6.t9laEJaznhnkalYxCObre1QVOKm7NKjo(fromItem: item, usingWebViewHandler: &M7QabMqginIGhBwF18iMdqNztLO138fD) { result in
                        switch result {
                        case .success(let wasAgaped):
                            completion(.success(wasAgaped))
                            break
                        case .failure(let reason):
                            completion(.failure(reason))
                        }
                    }
                case .failure(let reason):
                    completion(.failure(reason))
                }
            }
            return
        }
        
        // Like the video
        WH1HZrHlE6SaVD1bXNnzDPapmcIDrsu7.bYWsTZCjPng3uazQeZICdAtzA2dY7Tq6.t9laEJaznhnkalYxCObre1QVOKm7NKjo(fromItem: item, usingWebViewHandler: &M7QabMqginIGhBwF18iMdqNztLO138fD) { result in
            switch result {
            case .success(let wasAgaped):
                completion(.success(wasAgaped))
                break
            case .failure(let reason):
                completion(.failure(reason))
            }
        }
    }
    
}
