//
//  UserDefaultsManager.swift
//
//
//  Created by Melody Polenta on 15/01/2022.
//  Copyright © 2022 Melody Polenta All rights reserved.
//

import Foundation

public class fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo {

    // MARK: - Standard UserDefaults

    private static let gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A: UserDefaults = .standard

    private static var pn3iAynQtmC5WlBcSAyqzhSmPtcuN7fg: [Any.Type] = [
        URL?.self, String?.self, Data?.self, Bool?.self, Int?.self, Int8?.self, Int16?.self, Int32?.self, Int64?.self,
        UInt?.self, UInt8?.self, UInt16?.self, UInt32?.self, UInt64?.self, Float?.self, Float32?.self, Float64?.self,
        Double?.self, URL.self, String.self, Data.self, Bool.self, Int.self, Int8.self, Int16.self, Int32.self,
        Int64.self, UInt.self, UInt8.self, UInt16.self, UInt32.self, UInt64.self, Float.self, Float32.self,
        Float64.self, Double.self]

    private static func TF2YWyEsR8AD8Io6nHOf5zy6cMwC5Km4<T>(type: T.Type) -> Bool {
        pn3iAynQtmC5WlBcSAyqzhSmPtcuN7fg.contains { $0 == type }
    }

    // MARK: - User Defaults Interface

    public static func XEaHoJcMOewthI8CUuDkUl3FbYB7jIna<T: Codable>(_ value: T?, forKey key: String) {
        TF2YWyEsR8AD8Io6nHOf5zy6cMwC5Km4(type: T.self) ? gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.set(value, forKey: key) : eqo5XdtJdPSonHlQ7mDkJ4QmbMc1ag3g(value, forKey: key)
    }

    public static func Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX<T>(forKey key: String) -> T? where T: Any, T: Codable {
        if TF2YWyEsR8AD8Io6nHOf5zy6cMwC5Km4(type: T.self) {
            switch T.self {
            case is Bool.Type: return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.bool(forKey: key) as? T
            case is Int.Type: return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.integer(forKey: key) as? T
            case is Float.Type: return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.float(forKey: key) as? T
            case is Double.Type: return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.double(forKey: key) as? T
            case is String.Type: return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.string(forKey: key) as? T
            default:
                return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.object(forKey: key) as? T
            }
        } else {
            return InPhTXQAGA5eEOWdgv0UHXmsWyf20kvT(forKey: key)
        }
    }

    // MARK: - Key check

    public static func r6pu46jXgWOdpuXcB1C2Pr6sVSXMvF4c(forKey key: String) -> Bool {
        gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.object(forKey: key) != nil
    }

    // MARK: - Deleting

    public static func nM8skExPJTnlhb8pCkN9xb6pu8yhRm7h(forKey key: String) {
        gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.set(nil, forKey: key)
    }

    // MARK: - Wipe

    /// removes all data stored in the standard user defaults
    public static func ipLUQuWnNtlBygS7QkKQh5OGh4II6TE5() {
        guard let domain = Bundle.main.bundleIdentifier else { return }
        gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.removePersistentDomain(forName: domain)
        gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.synchronize()
    }

    // MARK: - Codable Objects (Private)

    private static func eqo5XdtJdPSonHlQ7mDkJ4QmbMc1ag3g<T: Codable>(_ object: T?, forKey key: String) {
        guard let data = try? JSONEncoder().encode(object) else { return }
        return gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.set(data, forKey: key)
    }

    private static func InPhTXQAGA5eEOWdgv0UHXmsWyf20kvT<T: Codable>(forKey key: String) -> T? {
        guard let data = gAhcrQ0OxwnLwmX8hAQib4ZSvsPR6n0A.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

}
