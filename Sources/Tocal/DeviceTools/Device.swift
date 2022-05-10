//
//  File.swift
//  
//
//  Created by Eric Cartmenez on 16/03/2022.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        index >= startIndex && index < endIndex ? self[index] : nil
    }

}


public struct RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV {

    public static var VhNVDAD1Strb55BUhl3mr6Budh68MQrL: String {
        guard let deviceID: String = fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX(forKey: dfnLsTm7Oq87MwAsQWV2jLMYhNqlhTuj.Gv344SphFWwB0iBP1vVF0abKMSSZoKV8) else {
            let uuidString = UUID().uuidString
            fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(uuidString, forKey: dfnLsTm7Oq87MwAsQWV2jLMYhNqlhTuj.Gv344SphFWwB0iBP1vVF0abKMSSZoKV8)
            return uuidString
        }
        return deviceID
    }

    public static func waUcNMoIOqF3vQr8ZQmormUhm85nLiYa() {
        fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.nM8skExPJTnlhb8pCkN9xb6pu8yhRm7h(forKey: dfnLsTm7Oq87MwAsQWV2jLMYhNqlhTuj.Gv344SphFWwB0iBP1vVF0abKMSSZoKV8)
    }

    public static var I7v81q5LTbOGMILL0wXHfiGqolYq7CVL: Bool {
        p38tislEkDmfaM5Trf2CDA3uaTpqRNLe.GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp(for: dfnLsTm7Oq87MwAsQWV2jLMYhNqlhTuj.hEHjHCMpS9vBNLhuK0CQRzNtN1pO760D) ?? false
    }

    public static var gL0sNTnnLimbnEsUJMS0GupSeaMvk3mO: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }

    public static var VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    public static var haLo1cdHo8CwUkvzUK49SzlqeNOAd4Uo: Bool = {
        if VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm.contains("iPhone"), // "iPhone"
           let firstNumberString = VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm.compactMap({ String($0) })[safe: 6],
           let firstNumber = Int(firstNumberString),
           (3...8).contains(firstNumber) {
            return true
        } else if VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm.contains("iPad"), // "iPad"
                  let firstNumberString = VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm.compactMap({ String($0) })[safe: 4],
                  let firstNumber = Int(firstNumberString),
                  (2...5).contains(firstNumber) {
            return true
        } else if VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm.contains("iPod") { // "iPod"
            return true
        } else {
            return false
        }
    }()

    // isJailbroken
    public static var Er2u6QOe6BOZndqmzQxZOPpeELbC7q6M: Bool {

        #if arch(i386) || arch(x86_64)
        // This is a Simulator not an idevice
        return false
        #endif

        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: "/Applications/Cydia.app") || // "/Applications/Cydia.app"
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") || // "/Library/MobileSubstrate/MobileSubstrate.dylib"
            fileManager.fileExists(atPath: "/bin/bash") || // "/bin/bash"
            fileManager.fileExists(atPath: "/usr/sbin/sshd") || // "/usr/sbin/sshd"
            fileManager.fileExists(atPath: "/etc/apt") || // "/etc/apt"
            fileManager.fileExists(atPath: "/usr/bin/ssh") || // "/usr/bin/ssh"
            fileManager.fileExists(atPath: "/private/var/lib/apt") { // "/private/var/lib/apt"
            return true
        }

        if bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/Applications/Cydia.app") || // "/Applications/Cydia.app"
            bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") || // "/Library/MobileSubstrate/MobileSubstrate.dylib"
            bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/bin/bash") || // "/bin/bash"
            bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/usr/sbin/sshd") || // "/usr/sbin/sshd"
            bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/etc/apt") || // "/etc/apt"
            bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: "/usr/bin/ssh"){ // "/usr/bin/ssh"
            return true
        }

        let path = "/private/" + NSUUID().uuidString // "/private/"
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8) // "anyString"
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }

    // isDebuggerAttached
    public static var lLUw0M3WUnNx3fZpJvvxhBEdCfCoC65V: Bool {
        var entomoIsAttached = false

        var name: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var info: kinfo_proc = kinfo_proc()
        var infoSize = MemoryLayout<kinfo_proc>.size

        let success = name.withUnsafeMutableBytes { (nameBytePtr: UnsafeMutableRawBufferPointer) -> Bool in
            guard let nameBytesBlindMemory = nameBytePtr.bindMemory(to: Int32.self).baseAddress else { return false }
            return -1 != sysctl(nameBytesBlindMemory, 4, &info, &infoSize, nil, 0)
        }

        if !success {
            entomoIsAttached = false
        }

        if !entomoIsAttached && (info.kp_proc.p_flag & P_TRACED) != 0 {
            entomoIsAttached = true
        }

        return entomoIsAttached
    }

    public static func bwstRrE9bf6LMHggtVQRdjDiTiH84MBW(path: String) -> Bool {
        let file = fopen(path, "r") // "r"
        guard file != nil else { return false }
        fclose(file)
        return true
    }

}
