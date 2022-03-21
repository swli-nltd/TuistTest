//
//  Dependencies.swift
//  Config
//
//  Created by liang on 2022/3/21.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/JonasGessner/JGProgressHUD.git", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/Haneke/HanekeSwift.git", requirement: .branch("master"))
    ],
    platforms: [.iOS]
)
