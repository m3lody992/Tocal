//
//  InAppAgapeDSPHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class frwmG60Fueg2vqXJJCQyZz693NxNoj6D: NSObject, x1ZVxZA73ncdFoB2DdRKQ1Hhw1n3SuRd {

    private var temporaryCompletionHolder: ((InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void)?
    private var isWaitingForAgapeResponse = false
    private var agapeTimer: Timer?

    override init() {
        super.init()
        UQrTfbDmh10eVykIEaXYKlrDL6dIg3jb()
    }

    private func UQrTfbDmh10eVykIEaXYKlrDL6dIg3jb() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(zcIB4AJLHhhsWzSmyrpxVIwpdjyWB9KM),
            name: CbSByOZWj5lKojSe9DofebyNclyVTtj8.RNAxtDHVFIJgZKwDg2auHTIFlrcUjmW4.UimISvCx6PFCHC3FuZxPdQJuEnhnszlS,
            object: nil)
    }

    private func QlrGfsE0wkE3QrGhFt9UlCmEvTAhBVV3() {
        NotificationCenter.default.removeObserver(
            self,
            name: CbSByOZWj5lKojSe9DofebyNclyVTtj8.RNAxtDHVFIJgZKwDg2auHTIFlrcUjmW4.UimISvCx6PFCHC3FuZxPdQJuEnhnszlS,
            object: nil)
    }

    deinit {
        qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
        QlrGfsE0wkE3QrGhFt9UlCmEvTAhBVV3()
    }

    // MARK: - Interface

    func t9laEJaznhnkalYxCObre1QVOKm7NKjo(fromItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, usingWebViewHandler loader: inout d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH, completion: @escaping (InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void) {

        temporaryCompletionHolder = completion
        isWaitingForAgapeResponse = true

        URLProtocol.iHifpxetcU3ztfGIZpJLHzEEg8H3Y0pk([27, 55, 4, 7, 58].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "https"
        URLProtocol.registerClass(bOfTArcDw0ZXaX7j9HTVjr8XnnzwJZnY.self)

        loader.g7KDByMaYlCZwcW85ChSyYIouL8SrEAt { [self] result in
            switch result {
            case .success(let isAgaped):
                switch isAgaped {
                case .HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb:
                    eOj7snQYOk8y7jAtxmEojHJpdXsz04Ai()
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

    @objc
    private func zcIB4AJLHhhsWzSmyrpxVIwpdjyWB9KM() {
        guard isWaitingForAgapeResponse else { return }
        
        func fail(forReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7) {
            GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: reason)
        }

        guard let data = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.cyHyNpW36KVWx8EKqVpiRZkjXVk0sh3q,
              let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
            fail(forReason: .Fh5mKzqZNO9q2xn9zYWKO497X4EsiQkP)
            return
        }

        guard let statusCode = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.dsp.statusPaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
            fail(forReason: .s3PcVAP3nT8ft4oKRZi6JBK5HzvuMPwG)
            return
        }

        guard statusCode == 0 else {
            fail(forReason: .NoR1z5trbSxBdN1fgPqkJPXxP1BpbBix(statusCode: statusCode))
            return
        }

        guard let isAgape = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.dsp.agapePaths.compactMap({ responseDictionary[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int else {
            fail(forReason: .j1A5HlOQYoH4cm8a1uLL86mL0BqH8R2N)
            return
        }

        guard isAgape == 0 else {
            fail(forReason: .N5mUX6R2D2lLvtBms7d1gLbC3h0QGYkz(agape: isAgape))
            return
        }

        DispatchQueue.main.async { [self] in
            // Disable listening for DSP and return success
            URLProtocol.hyVZivQ1Bv8MhFSdwsJkp9jAFD0kW4te([27, 55, 4, 7, 58].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "https"
            URLProtocol.unregisterClass(bOfTArcDw0ZXaX7j9HTVjr8XnnzwJZnY.self)

            temporaryCompletionHolder?(.success(.HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb))
            temporaryCompletionHolder = nil
            isWaitingForAgapeResponse = false
            qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
        }
    }

    // MARK: - Timers

    @objc
    private func qElHtvLzAttpYL6B4cx66RhZkyGxMt8C() {
        GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .t3dXwDLXv8ceZ8QPrI5IcjV7tHQL7sjJ)
    }

    private func eOj7snQYOk8y7jAtxmEojHJpdXsz04Ai() {
        qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
        agapeTimer = Timer.scheduledTimer(
            timeInterval: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agapeHandlerSettings.dsp.timerTimeout,
            target: self,
            selector: #selector(self.qElHtvLzAttpYL6B4cx66RhZkyGxMt8C),
            userInfo: nil,
            repeats: false)
    }

    private func qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg() {
        agapeTimer?.invalidate()
        agapeTimer = nil
    }

    // MARK: - Failure completions

    private func GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7) {
        if isWaitingForAgapeResponse {
            DispatchQueue.main.async { [self] in 
                // Disable listening for DSP
                URLProtocol.hyVZivQ1Bv8MhFSdwsJkp9jAFD0kW4te([27, 55, 4, 7, 58].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "https"
                URLProtocol.unregisterClass(bOfTArcDw0ZXaX7j9HTVjr8XnnzwJZnY.self)

                temporaryCompletionHolder?(.failure(reason))
                temporaryCompletionHolder = nil
                isWaitingForAgapeResponse = false
                qLjhXsCKE8X7je3q5srYpqpYQB3fT9jg()
            }
        }
    }
}

