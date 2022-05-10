//
//  PresentNitificationService.swift
//  
//
//  Created by Pepe Polenta on 16/11/2020.
//  Copyright © 2020 Pepe Polenta. All rights reserved.
//

import UIKit

public struct uLqUbQeeMrmNOzgeidxtmYQ8bRgLd58J {

    let VhNVDAD1Strb55BUhl3mr6Budh68MQrL = UUID().uuidString
    let sQy15HWKctAkACm2pD9dxrHKEl4wNTnt: String?
    let Bsg1vfzSynIHkPMzassMn2navlQV1Puf: String?
    let qz5iOlriwogxmRzt4lkaJwuIAgMlKWny: URL?
    let CuZuByvp4XmIPhkaiJt3gv0AfQc7brkP: [AdIl2vezyKJkhIcHCfb0FfTGhhJ7Dcpn]
    let AoDtL23sz9XtODbEwc0bpqsZZV1sdb5C: (() -> Void)? // Completion only executes on button press of .ok
    let X60cleOWsZoJrYTw27ULBzJTwe1g8xv2: (() -> Void)?

    public init(title: String?, message: String?, imageURL: URL? = nil, buttons: [AdIl2vezyKJkhIcHCfb0FfTGhhJ7Dcpn] = [.grb6TiJukBTRVhDCwf7NauTcStn1037q], onOk: (() -> Void)? = nil, onDismiss: (() -> Void)? = nil) {
        self.sQy15HWKctAkACm2pD9dxrHKEl4wNTnt = title
        self.Bsg1vfzSynIHkPMzassMn2navlQV1Puf = message
        self.qz5iOlriwogxmRzt4lkaJwuIAgMlKWny = imageURL
        self.CuZuByvp4XmIPhkaiJt3gv0AfQc7brkP = buttons
        self.AoDtL23sz9XtODbEwc0bpqsZZV1sdb5C = onOk
        self.X60cleOWsZoJrYTw27ULBzJTwe1g8xv2 = onDismiss
    }

}

public struct PU0EV0u4NxFxcwDiMjTzgw7bQPM1Rej0 {

    private static var AkRKiAKpdGy19802rM8EriIHe8TNaJYr: U1010LVFtldGaAOHrygLsknsAV9vRBNM? {
        UIApplication.bJJe2odsAz6KqB90pvqXsUHy5WCQOsYW() as? U1010LVFtldGaAOHrygLsknsAV9vRBNM
    }

    private static var UtAEBR0h7S1LGdXZbuZ4jbdvydHeQGgT = false
    private static var D87jmJMiXWH1LcULxxLzVM6Hgxx7XQwT = false

    private static var r15upekfGv70E3LgrPajjn1GRgWieROH = [uLqUbQeeMrmNOzgeidxtmYQ8bRgLd58J]()

    // Used when not presenting imediately
    public static func jbyZ4lbbTqufMn0JVhDSWfakt5p59QhP(_ notification: uLqUbQeeMrmNOzgeidxtmYQ8bRgLd58J) {
        r15upekfGv70E3LgrPajjn1GRgWieROH.append(notification)
    }

    // Used when presenting imediately, handles already presenting
    public static func FO4Ga2M1SC9Z2azkcVifb548dS0Qa8MN(_ notification: uLqUbQeeMrmNOzgeidxtmYQ8bRgLd58J) {
        r15upekfGv70E3LgrPajjn1GRgWieROH.append(notification)
        D87jmJMiXWH1LcULxxLzVM6Hgxx7XQwT = UtAEBR0h7S1LGdXZbuZ4jbdvydHeQGgT
        if UtAEBR0h7S1LGdXZbuZ4jbdvydHeQGgT == false {
            FyTBmJU2TkJx0Ff7UvWEYi26JMYLhEAC()
        }
    }

    public static func FyTBmJU2TkJx0Ff7UvWEYi26JMYLhEAC() {
        DispatchQueue.global(qos: .userInteractive).async {
            let semaphore = DispatchSemaphore(value: 0)
            UtAEBR0h7S1LGdXZbuZ4jbdvydHeQGgT = true
            D87jmJMiXWH1LcULxxLzVM6Hgxx7XQwT = false
            for notification in r15upekfGv70E3LgrPajjn1GRgWieROH {
                DispatchQueue.main.async {
                    ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: notification.sQy15HWKctAkACm2pD9dxrHKEl4wNTnt, andMessage: notification.Bsg1vfzSynIHkPMzassMn2navlQV1Puf, imageURL: notification.qz5iOlriwogxmRzt4lkaJwuIAgMlKWny, buttons: notification.CuZuByvp4XmIPhkaiJt3gv0AfQc7brkP) {
                        notification.AoDtL23sz9XtODbEwc0bpqsZZV1sdb5C?()
                        semaphore.signal()
                    } onDismiss: {
                        notification.X60cleOWsZoJrYTw27ULBzJTwe1g8xv2?()
                        semaphore.signal()
                    }
                    r15upekfGv70E3LgrPajjn1GRgWieROH.removeAll(where: { $0.VhNVDAD1Strb55BUhl3mr6Budh68MQrL == notification.VhNVDAD1Strb55BUhl3mr6Budh68MQrL })
                }
                semaphore.wait()
            }

            if D87jmJMiXWH1LcULxxLzVM6Hgxx7XQwT {
                FyTBmJU2TkJx0Ff7UvWEYi26JMYLhEAC()
            } else {
                UtAEBR0h7S1LGdXZbuZ4jbdvydHeQGgT = false
            }
        }
    }

    // Image URL is only for showing promotional app logo, rating is applied automatically. If we will need images without rating this should be updated.
    private static func ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle title: String?, andMessage message: String?, imageURL: URL? = nil, buttons: [AdIl2vezyKJkhIcHCfb0FfTGhhJ7Dcpn] = [.grb6TiJukBTRVhDCwf7NauTcStn1037q], onOk: (() -> Void)? = nil, onDismiss: (() -> Void)? = nil) {
        DispatchQueue.main.async {

            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            if let imageURL = imageURL {
                alert.message = "\n\n\n\n\n\n" + (message ?? "") // "\n\n\n\n\n\n"

                // Add image view
                let widthAndHeight = 50
                let imageView = UIImageView(frame: CGRect(x: 135 - widthAndHeight / 2, y: 48, width: widthAndHeight, height: widthAndHeight))
                imageView.layer.masksToBounds = true
                imageView.layer.cornerRadius = 6
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(with: imageURL)
                alert.view.addSubview(imageView)

                // Add rating label
                let labelWidth = 120
                let label = UILabel(frame: CGRect(x: 135 - labelWidth / 2, y: 104, width: labelWidth, height: 32))
                label.textAlignment = .center
                label.text = Omq3ijC5qdS04g0cUChRZ8cAAKhCRuu2.Lq98ffw1gKqc0Fu3kG8G71FlsSEoFALc.bX3VO5QMHrUgWHf7uMNPvnE18UxTxtUd // "⭐️⭐️⭐️⭐️⭐️"
                alert.view.addSubview(label)
            }

            for button in buttons {
                switch button {
                case .grb6TiJukBTRVhDCwf7NauTcStn1037q:
                    alert.addAction(.init(title: "OK", style: .default) { _ in onOk?() }) // OK
                case .ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt:
                    alert.addAction(.init(title: "Cancel", style: .default) { _ in // Cancel
                        onDismiss?()
                        alert.dismiss(animated: true, completion: nil)
                    })
                case .fmSMx6JT4HOWo9mmomXqGjpuIPFb1IDj:
                    alert.addAction(.init(title: "Later", style: .default) { _ in // Later
                        onDismiss?()
                        alert.dismiss(animated: true, completion: nil)
                    })
                case .Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6:
                    alert.addAction(.init(title: "OK", style: .default) { _ in // OK
                        onDismiss?()
                        alert.dismiss(animated: true, completion: nil)
                    })
                }
            }

            AkRKiAKpdGy19802rM8EriIHe8TNaJYr?.present(alert, animated: true, completion: nil)
        }
    }

}
