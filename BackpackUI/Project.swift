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

//
let project = Project(name:"BackpackUI", organizationName: "zhiyili.ui",
targets: [
    Target(name:"BackpackUI", platform: .iOS, product: .framework,bundleId: "zhiyili.backpackui", sources: ["../BackpackUI/Sources/**"],resources: ["../BackpackUI/Resources/**","../BackpackUI/Sources/**"],
          dependencies: [
            .project(target: "Common", path: "../App")
        
//            .external(name: "Haneke")
          ]
          )])


