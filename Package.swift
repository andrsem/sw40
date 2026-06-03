// swift-tools-version: 6.2
// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import PackageDescription

private let settings: [SwiftSetting] = [
   .enableUpcomingFeature("ExistentialAny"),
   .enableUpcomingFeature("InternalImportsByDefault"),
   .enableUpcomingFeature("MemberImportVisibility"),
   .enableUpcomingFeature("InferIsolatedConformances"),
   .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
   .strictMemorySafety(),
]


let package = Package(
   name: "sw40",
   platforms: [
      .macOS(.v13),
      .watchOS(.v9),
      .visionOS(.v1),
      .iOS(.v16),
      .tvOS(.v16),
   ],
   products: [.library(name: "SW40", targets: ["SW40"])],
   targets: [
      .target(name: "SW40", swiftSettings: settings),
      .testTarget(
         name: "SW40Tests",
         dependencies: ["SW40"],
         swiftSettings: settings
      ),
   ]
)
