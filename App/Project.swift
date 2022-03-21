import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains TuistTest App target and TuistTest unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(name: "TuistTest",
                      organizationName: "zhiyili",
targets: [
    Target(name: "bazi", platform: .iOS, product: .app, bundleId: "zhiyili.bazi", sources: ["Sources/**"], resources: ["Resources/**"],
           dependencies: [
            .target(name: "Common"),
            .external(name: "JGProgressHUD"),
            .project(target: "BackpackUI", path: "../BackpackUI"),
            .target(name: "Detail"),
            .target(name: "Network"),
            .target(name: "CatchUI"),
            .target(name: "HomeUI")
            
    ]),
    Target(name: "Common", platform: .iOS, product: .framework, bundleId: "zhiyili.common", sources: ["Common/**"], resources: ["Common/**/*.xib"]),
    Target(name:"Network", platform: .iOS, product: .framework, bundleId: "zhiyili.network", sources: ["Network/**"],resources: ["Network/Resources/**"],
          dependencies: [
            .target(name: "Common")]),
    Target(name:"CatchUI", platform: .iOS, product: .framework,bundleId: "zhiyili.catchui", sources: ["CatchUI/Sources/**"],resources: ["CatchUI/Resources/**","CatchUI/Sources/**"],
          dependencies: [
            .target(name: "Common"),
            .external(name: "Haneke"),
            .external(name: "JGProgressHUD"),
            .target(name: "Network")
          ]),
    Target(name:"Detail", platform: .iOS, product: .framework,bundleId: "zhiyili.detail", sources: ["Detail/Sources/**"],resources: ["Detail/Sources/**"],
          dependencies: [
            .target(name: "Common"),
            .external(name: "Haneke")
          ]),
    Target(name:"HomeUI", platform: .iOS, product: .framework,bundleId: "zhiyili.homeui", sources: ["HomeUI/Sources/**"],resources: ["HomeUI/Sources/**"],
          dependencies: [
            .target(name: "Common"),
            .external(name: "JGProgressHUD"),
          ]),
])


