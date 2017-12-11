
import Foundation
import HTTPServerCore
//
//let server = HttpServer(listenOnPort: 8090)
//try server.runForever()

let nav = DirectoryNavigator()

let files = try nav.listFilesAndFileTypes(atPath: "/README.md")
print(files)