// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeCab",
    products: [
        .library(
            name: "MeCab",
            targets: ["MeCabObjC"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/trickart/libmecab.git",
            .exact("0.996.0")
        )
    ],
    targets: [
        .target(
            name: "MeCabObjC",
            dependencies: ["libmecab"]
        ),
        .testTarget(
            name: "MeCabTests",
            dependencies: ["MeCabObjC"]
        )
    ]
)
