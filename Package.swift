// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CodableAppStorage",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "CodableAppStorage",
            targets: ["CodableAppStorage"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CodableAppStorage",
            dependencies: []
        )
    ]
)
