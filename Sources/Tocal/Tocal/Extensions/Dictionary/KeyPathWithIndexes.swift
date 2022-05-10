//
//  KeyPathWithIndexes.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 22/04/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation

struct ObPmplP1fAcuSoyfElu17V8glsidUVgk {
    var LigSauESi3gGbvj3smhtgvWhVCNbLOL9: [String]

    var CvWZXFTTWV8n6jevF0auEOPeuqnhW4dh: Bool { return LigSauESi3gGbvj3smhtgvWhVCNbLOL9.isEmpty }
    var k9xAla0pwAG5943OD4QLHTPSjrnsfODl: String {
        return LigSauESi3gGbvj3smhtgvWhVCNbLOL9.joined(separator: ".")
    }

    /// Strips off the first segment and returns a pair
    /// consisting of the first segment and the remaining key path.
    /// Returns nil if the key path has no segments.
    func NEhL2HIx9AuEL6IRVts8xiDrHWP9tr1l() -> (head: String, tail: ObPmplP1fAcuSoyfElu17V8glsidUVgk)? {
        guard !CvWZXFTTWV8n6jevF0auEOPeuqnhW4dh else { return nil }
        var tail = LigSauESi3gGbvj3smhtgvWhVCNbLOL9
        let head = tail.removeFirst()
        return (head, ObPmplP1fAcuSoyfElu17V8glsidUVgk(LigSauESi3gGbvj3smhtgvWhVCNbLOL9: tail))
    }
}

/// Initializes a KeyPath with a string of the form "this.is.a.keypath"
extension ObPmplP1fAcuSoyfElu17V8glsidUVgk {
    init(_ string: String) {
        LigSauESi3gGbvj3smhtgvWhVCNbLOL9 = string.components(separatedBy: ".")
    }
}

extension ObPmplP1fAcuSoyfElu17V8glsidUVgk: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.init(value)
    }
    init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
    init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}

protocol mDDT866Gj4u1SKUqWXctDMt0Oh7jsmAy {
    init(string s: String)
}

extension String: mDDT866Gj4u1SKUqWXctDMt0Oh7jsmAy {
    init(string s: String) {
        self = s
    }
}

extension Dictionary where Key: mDDT866Gj4u1SKUqWXctDMt0Oh7jsmAy {
    subscript(keyPath keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk) -> Any? {
        
        get {
            switch keyPath.NEhL2HIx9AuEL6IRVts8xiDrHWP9tr1l() {
            case nil:
                // key path is empty.
                return nil
            case let (head, remainingKeyPath)? where remainingKeyPath.CvWZXFTTWV8n6jevF0auEOPeuqnhW4dh:
                // Reached the end of the key path.
                let key = Key(string: head)
                return self[key]
            case let (head, remainingKeyPath)?:
                // Key path has a tail we need to traverse.
                let key = Key(string: head)
                switch self[key] {
                case let nestedDict as [Key: Any]:
                    // Next nest level is a dictionary.
                    // Start over with remaining key path.
                    return nestedDict[keyPath: remainingKeyPath]
                default:
                    // Next nest level isn't a dictionary.
                    // Invalid key path, abort.
                    return nil
                }
            }
        }
        // ...
        set {
            switch keyPath.NEhL2HIx9AuEL6IRVts8xiDrHWP9tr1l() {
            case nil:
                // key path is empty.
                return
            case let (head, remainingKeyPath)? where remainingKeyPath.CvWZXFTTWV8n6jevF0auEOPeuqnhW4dh:
                // Reached the end of the key path.
                let key = Key(string: head)
                self[key] = newValue as? Value
            case let (head, remainingKeyPath)?:
                let key = Key(string: head)
                let value = self[key]
                switch value {
                case var nestedDict as [Key: Any]:
                    // Key path has a tail we need to traverse
                    nestedDict[keyPath: remainingKeyPath] = newValue
                    self[key] = nestedDict as? Value
                default:
                    // Invalid keyPath
                    return
                }
            }
        }
    }
}

extension Dictionary where Key: mDDT866Gj4u1SKUqWXctDMt0Oh7jsmAy {
    subscript(string keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk) -> String? {
        get { return self[keyPath: keyPath] as? String }
        set { self[keyPath: keyPath] = newValue }
    }

    subscript(dict keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk) -> [Key: Any]? {
        get { return self[keyPath: keyPath] as? [Key: Any] }
        set { self[keyPath: keyPath] = newValue }
    }
}
