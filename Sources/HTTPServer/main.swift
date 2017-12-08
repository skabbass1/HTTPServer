
import Foundation
import HTTPServerCore

let server = HttpServer(listenOnPort: 8090)
try server.runForever()