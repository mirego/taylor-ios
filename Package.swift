// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "Taylor",
    platforms: [
        .iOS(.v9),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "Taylor", targets: ["Taylor"])
    ],
    targets: [
        .target(
            name: "Taylor",
            path: "Sources/Taylor",
            exclude: ["Info.plist", "UIView+Taylor.swift.orig"]
        ),
        .testTarget(
            name: "TaylorTests",
            dependencies: ["Taylor"],
            path: "Tests/TaylorTests",
            exclude: ["Info.plist"]
        )
    ]
)
