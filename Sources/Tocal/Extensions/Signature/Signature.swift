//
//  Signature.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 22/04/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation

struct Signature {
    
    static func a1(n:Int) -> String {
        var c = ""
        switch (n) {
        case 0:
            c = "f"
            break;
        case 1:
            c = "k"
            break;
        case 2:
            c = "z"
            break;
        case 3:
            c = "y"
            break;
        case 4:
            c = "n"
            break;
        case 5:
            c = "a"
            break;
        case 6:
            c = "v"
            break;
        case 7:
            c = "s"
            break;
        case 8:
            c = "g"
            break;
        case 9:
            c = "b"
            break;
        default:
            break;
        }
        return c
    }
    
    static func a2(n:Int) -> String {
        var c = ""
        switch (n) {
        case 0:
            c = "a"
            break;
        case 1:
            c = "c"
            break;
        case 2:
            c = "h"
            break;
        case 3:
            c = "w"
            break;
        case 4:
            c = "y"
            break;
        case 5:
            c = "r"
            break;
        case 6:
            c = "g"
            break;
        case 7:
            c = "j"
            break;
        case 8:
            c = "m"
            break;
        case 9:
            c = "o"
            break;
        default:
            break;
        }
        return c;
    }
    
    static func frm(lp1: String, lp2: String) -> String? {
        let chars = Array(lp1)
        var aa1: [String] = []
        for c in chars {
            let num = Int("\(c)")!
            aa1.append(a1(n: num))
        }
        let p1 = aa1.joined(separator: "")
        let chars1 = Array(lp2)
        var aa2: [String] = []
        for c in chars1 {
            let num = Int("\(c)")!
            aa2.append(a2(n: num))
        }
        let l1: String = "\(chars[(chars.last?.wholeNumberValue)!])"
        let l2: String = "\(chars[(chars1.last?.wholeNumberValue)!])"
        aa2.append(a1(n: Int(l1)!))
        aa2.append(a2(n: Int(l2)!))
        let p2 = aa2.joined(separator: "")
        return  p1+p2
    }
}
