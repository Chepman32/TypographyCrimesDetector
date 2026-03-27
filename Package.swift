// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "TypographyCrimesDetector",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "TypographyDomain", targets: ["TypographyDomain"]),
        .library(name: "TypographyEngine", targets: ["TypographyEngine"]),
        .library(name: "TypographyDesignSystem", targets: ["TypographyDesignSystem"]),
        .library(name: "TypographyFeatures", targets: ["TypographyFeatures"]),
    ],
    targets: [
        .target(name: "TypographyDomain"),
        .target(
            name: "TypographyEngine",
            dependencies: ["TypographyDomain"]
        ),
        .target(
            name: "TypographyDesignSystem",
            dependencies: ["TypographyDomain"]
        ),
        .target(
            name: "TypographyFeatures",
            dependencies: [
                "TypographyDomain",
                "TypographyEngine",
                "TypographyDesignSystem",
            ]
        ),
        .testTarget(
            name: "TypographyDomainTests",
            dependencies: ["TypographyDomain"]
        ),
        .testTarget(
            name: "TypographyEngineTests",
            dependencies: [
                "TypographyEngine",
                "TypographyDomain",
            ]
        ),
        .testTarget(
            name: "TypographyFeaturesTests",
            dependencies: [
                "TypographyFeatures",
                "TypographyDomain",
                "TypographyEngine",
            ]
        ),
    ]
)
