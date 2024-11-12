// swift-tools-version:5.0

//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


// import PackageDescription

// let package = Package(
//   name: "Auth",
//   platforms: [
//     .macOS(.v10_12), .iOS(.v9), .tvOS(.v9)
//   ],
//   products: [
//     // .library(name: "OAuth1", targets: ["OAuth1"]),
//     .library(name: "OAuth2", targets: ["OAuth2"]),
//     // .library(name: "TinyHTTPServer", targets: ["TinyHTTPServer"]),
//     // .library(name: "SwiftyBase64", targets: ["SwiftyBase64"]),
//   ],
//   dependencies: [
//     .package(url: "https://github.com/apple/swift-nio.git", .exact("2.32.3")),
//     .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .exact("1.0.0")),
//     .package(url: "https://github.com/attaswift/BigInt", .upToNextMajor(from: "3.1.0")),
//   ],
//   targets: [
//     // .target(name: "OAuth1",
//             // dependencies: ["CryptoSwift", "TinyHTTPServer"]),
//     .target(name: "OAuth2",
//             // dependencies: ["CryptoSwift", "TinyHTTPServer", "BigInt", "SwiftyBase64"],
// 	    dependencies: ["CryptoSwift", "BigInt", "SwiftyBase64", "TinyHTTPServer"],
//             exclude: ["FCMTokenProvider"]),
//     // .target(name: "TinyHTTPServer",
// 	    // dependencies: ["NIO", "NIOHTTP1"]),
//     // .target(name: "SwiftyBase64"),
//     // .target(name: "TokenSource", dependencies: ["OAuth2"], path: "Sources/Examples/TokenSource"),
//     // .target(name: "Google",      dependencies: ["OAuth2"], path: "Sources/Examples/Google"),
//     // .target(name: "GitHub",      dependencies: ["OAuth2"], path: "Sources/Examples/GitHub"),
//     // .target(name: "Meetup",      dependencies: ["OAuth2"], path: "Sources/Examples/Meetup"),
//     // .target(name: "Spotify",     dependencies: ["OAuth2"], path: "Sources/Examples/Spotify"),
//     // .target(name: "Twitter",     dependencies: ["OAuth1"], path: "Sources/Examples/Twitter"),
//   ]
// )

import PackageDescription

let package = Package(
    name: "Auth",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "OAuth2",
            targets: ["OAuth2"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.0.0"),
        .package(url: "https://github.com/attaswift/BigInt", from: "3.1.0"),
        // .package(url: "https://github.com/saoudrizwan/SwiftyBase64.git", from: "1.1.1"),
        .package(url: "https://github.com/drichardson/SwiftyBase64.git", from: "1.1.1"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.32.0"),
        // .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.0.0")
    ],
    targets: [
        .target(
            name: "OAuth2",
            dependencies: [
                "CryptoSwift",
                "BigInt",
                "SwiftyBase64",
                .product(name: "NIO", package: "swift-nio"),
                // .product(name: "NIOHTTP1", package: "swift-nio"),
                // .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                // .product(name: "FirebaseFunctions", package: "firebase-ios-sdk"),
                // .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                // .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ],
            path: "Sources",
            sources: [
                "OAuth2/Code.swift",
                "OAuth2/Connection.swift",
                "OAuth2/ServiceAccountTokenProvider/ASN1.swift",
                "OAuth2/ServiceAccountTokenProvider/JWT.swift",
                "OAuth2/ServiceAccountTokenProvider/RSA.swift",
                "OAuth2/ServiceAccountTokenProvider/ServiceAccountTokenProvider.swift",
                "OAuth2/Token.swift",
                "OAuth2/TokenProvider.swift",
                "OAuth2/FCMTokenProvider/FCMTokenProvider.swift"
            ]
        )
    ],
)
