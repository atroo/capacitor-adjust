// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AtrooCapacitorAdjust",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AtrooCapacitorAdjust",
            targets: ["AtrooAdjustPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.4.3"),
        .package(url: "https://github.com/adjust/ios_sdk.git", from: "5.4.4")
    ],
    targets: [
        .target(
            name: "AtrooAdjustPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "AdjustSdk", package: "ios_sdk")
            ],
            path: "ios/Sources/AdjustPlugin"),
        .testTarget(
            name: "AdjustPluginTests",
            dependencies: ["AtrooAdjustPlugin"],
            path: "ios/Tests/AdjustPluginTests")
    ]
)
