// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Drawer",
    products: [
        .library(
            name: "Drawer",
            targets: ["Drawer"]),
    ],
    targets: [
        .target(name: "Drawer"),
    ]
)
