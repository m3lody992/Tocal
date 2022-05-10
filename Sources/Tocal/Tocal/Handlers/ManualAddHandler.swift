//
//  ManualAddHandler.swift
//  PixelSDK
//
//  Created by miha on 25/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation

class nFBH75UtiJ2N6PMlezWbrRCvBdbVzJay {
    
    var M7QabMqginIGhBwF18iMdqNztLO138fD = d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH()
    let J3yZz8CNI7JUsMSy4cUY7m781JmygT9t = rrEmMrtraKHK5lTSBFXpOnMPd59izR0f(variation: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.manualAddHandlerSettings.infoHandlerVariation)
    var BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM = 0
    
    func GqUD6AMFymDioucSTkBjC57vfBmcGdgp(forURL url: URL, completion: @escaping (InfoResult<BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8>) -> Void) {
        func loadAndHandleURL() {
            M7QabMqginIGhBwF18iMdqNztLO138fD.strK3WgF3cl4GIWQbegrYPS9bi3QLKmK(url) { result in
                switch result {
                case .success(let webView):
                    webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.manualAddHandlerSettings.getLinkEJS) { result, error in
                        guard let shareURLString = result as? String,
                              let shareURL = URL(string: shareURLString),
                              error == nil else {
                                  if self.BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM <= OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.manualAddHandlerSettings.retryCountLimit {
                                      self.BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM += 1
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.manualAddHandlerSettings.retryDelay) {
                                          loadAndHandleURL()
                                      }
                                  } else {
                                      self.BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM = 0
                                      completion(.failure(.IWohDaCqvYre0UReyRBBZCvIiuucRc42))
                                  }
                                  return
                              }
                        self.BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM = 0
                        
                        self.J3yZz8CNI7JUsMSy4cUY7m781JmygT9t.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL: shareURL, usingLoader: &self.M7QabMqginIGhBwF18iMdqNztLO138fD, completion: completion)
                    }
                case .failure(let reason):
                    self.BW2p6L7NxPkCIDCY5OiW2IglzpPUClCM = 0
                    completion(.failure(reason))
                }
            }
        }
        
        if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.manualAddHandlerSettings.useLinkEJS {
            loadAndHandleURL()
        } else {
            J3yZz8CNI7JUsMSy4cUY7m781JmygT9t.Es9FzGvUMZqjUWFgcYcSAAQI560LBpwx(forURL: url, usingLoader: &M7QabMqginIGhBwF18iMdqNztLO138fD, completion: completion)
        }
    }
}
