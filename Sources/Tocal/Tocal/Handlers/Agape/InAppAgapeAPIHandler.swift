//
//  InAppAgapeAPIHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

enum yfWBktribii1w4l1JetNgkhBQqwoNSmE {
    case HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb // successful like
    case fmbGGvWPuST4dFqWMCRUMeLFKvv3ruGZ // confirmed failed like; Successful heart icon change but API returns isAgaped = false
    case IFDA5J4QN4Ezw2nvCbFhnnTEO5bPCAk5 // heart icon didn't change
}

class xS9M6SD3fBld8DEVlJpJwGMO3BPxsHTk: x1ZVxZA73ncdFoB2DdRKQ1Hhw1n3SuRd {

    private var psDIO6RisIsNXgDpjdvb2miFn5ff1EBI: ((InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void)?
    private var RNsBJJlKuFuHmXQZHbXwGkkcHacdZ99q = false

    var Y2gn4j8Q7u2STwcI5thbGZ9Tn54oBjBq: Timer?

    private var qljFIWXxRRKfENRAHAF4QTqMI4XAV8Vz: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN?

    // MARK: - Interface

    func t9laEJaznhnkalYxCObre1QVOKm7NKjo(fromItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, usingWebViewHandler loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void) {
        qljFIWXxRRKfENRAHAF4QTqMI4XAV8Vz = item
        RNsBJJlKuFuHmXQZHbXwGkkcHacdZ99q = true
        psDIO6RisIsNXgDpjdvb2miFn5ff1EBI = completion

        loader.g7KDByMaYlCZwcW85ChSyYIouL8SrEAt { [self] result in
            switch result {
            case .success(let isAgaped):
                
                switch isAgaped {
                case .HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb:
                    eOj7snQYOk8y7jAtxmEojHJpdXsz04Ai()
                    
                    Qj3FmNqrY5yY2Bd9uh1kGME3J7QEGCqb() { result in
                        switch result {
                        case .success(let isAgaped):
                            if isAgaped {
                                DispatchQueue.main.async { [self] in
                                    psDIO6RisIsNXgDpjdvb2miFn5ff1EBI?(.success(.HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb))
                                    psDIO6RisIsNXgDpjdvb2miFn5ff1EBI = nil
                                    RNsBJJlKuFuHmXQZHbXwGkkcHacdZ99q = false
                                    qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
                                }
                            } else {
                                GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .HBgNx8jJcqzJSIdAZBCrBRDYdS6702s6)
                            }
                        case .failure(let error):
                            GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: error)
                        }
                    }
                case .IFDA5J4QN4Ezw2nvCbFhnnTEO5bPCAk5:
                    completion(.success(.IFDA5J4QN4Ezw2nvCbFhnnTEO5bPCAk5))
                case .fmbGGvWPuST4dFqWMCRUMeLFKvv3ruGZ:
                    completion(.success(.fmbGGvWPuST4dFqWMCRUMeLFKvv3ruGZ))
                }
            case .failure(let reason):
                GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: reason)
            }
        }

    }

    // MARK: - Private Functions

    private var mh3a1LfcdQIlw5Nyxi4zHie4cvormniN = 0

    private func Qj3FmNqrY5yY2Bd9uh1kGME3J7QEGCqb(completion: @escaping (InfoResult<Bool>) -> Void) {

        guard let item = qljFIWXxRRKfENRAHAF4QTqMI4XAV8Vz else {
            GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .FcZQGrfLSfR3kkjjJgexzvQ7pPfKmuLL) // TODO: FIX
             return
        }

        ie7ZaBFE4QpUUuqCBofrJoc4ywn0v0Gl.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forItem: item) { [self] result in
            switch result {
            case .success(let info):
                if info.WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU {
                    mh3a1LfcdQIlw5Nyxi4zHie4cvormniN = 0
                    completion(.success(true))
                } else {
                    mh3a1LfcdQIlw5Nyxi4zHie4cvormniN += 1
                    guard mh3a1LfcdQIlw5Nyxi4zHie4cvormniN < OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.api.retryCountLimit else {
                        mh3a1LfcdQIlw5Nyxi4zHie4cvormniN = 0
                        completion(.failure(.HBgNx8jJcqzJSIdAZBCrBRDYdS6702s6))
                        return
                    }
                    DispatchQueue.global().asyncAfter(deadline: .now() + Double(mh3a1LfcdQIlw5Nyxi4zHie4cvormniN) * OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.api.delayIncrement) {
                        Qj3FmNqrY5yY2Bd9uh1kGME3J7QEGCqb(completion: completion)
                    }
                }
            case .failure(let resason):
                completion(.failure(resason))
            }
        }
    }

    // MARK: - Timers

    @objc
    private func qElHtvLzAttpYL6B4cx66RhZkyGxMt8C() {
        GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .t3dXwDLXv8ceZ8QPrI5IcjV7tHQL7sjJ)
    }

    private func eOj7snQYOk8y7jAtxmEojHJpdXsz04Ai() {
        qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
        Y2gn4j8Q7u2STwcI5thbGZ9Tn54oBjBq = Timer.scheduledTimer(
            timeInterval: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.api.timerTimeout,
            target: self,
            selector: #selector(self.qElHtvLzAttpYL6B4cx66RhZkyGxMt8C),
            userInfo: nil,
            repeats: false)
    }

    private func qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg() {
        Y2gn4j8Q7u2STwcI5thbGZ9Tn54oBjBq?.invalidate()
        Y2gn4j8Q7u2STwcI5thbGZ9Tn54oBjBq = nil
    }

    private func GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7) {
        if RNsBJJlKuFuHmXQZHbXwGkkcHacdZ99q {
            DispatchQueue.main.async { [self] in
                psDIO6RisIsNXgDpjdvb2miFn5ff1EBI?(.failure(reason))
                psDIO6RisIsNXgDpjdvb2miFn5ff1EBI = nil
                RNsBJJlKuFuHmXQZHbXwGkkcHacdZ99q = false
                qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
            }
        }
    }
    
    deinit {
        qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
    }

}

