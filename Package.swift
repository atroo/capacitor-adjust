// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SgdbCapacitorAdjust",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SgdbCapacitorAdjust",
            targets: ["AdjustPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "AdjustPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/AdjustPlugin"),
        .testTarget(
            name: "AdjustPluginTests",
            dependencies: ["AdjustPlugin"],
            path: "ios/Tests/AdjustPluginTests")
    ]
)