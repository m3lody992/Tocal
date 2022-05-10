// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tocal",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Tocal",
            targets: ["Tocal"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/onevcat/Kingfisher", from: "7.2.0"),
         .package(url: "https://github.com/JonasGessner/JGProgressHUD", from: "2.2.0"),
         .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "1.5.1"),
         .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
         .package(url: "https://github.com/ashleymills/Reachability.swift", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Tocal",
            dependencies: ["Kingfisher", "JGProgressHUD", "CryptoSwift", "KeychainAccess", .product(name: "Reachability", package: "Reachability.swift")])
    ]
)
