import PackageDescription
 
let package = Package(
    name: "BackendSwift",
    dependencies: [
        .Package(
            url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
            majorVersion: 2, minor: 0
        ),
        .Package(url: "https://github.com/SwiftORM/MySQL-StORM.git", majorVersion: 1, minor: 0)

    ]
)
