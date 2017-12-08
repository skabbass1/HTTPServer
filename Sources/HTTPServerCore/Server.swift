import Foundation
import Socket

public final class HttpServer {
    let listenOnPort: Int

    public init(listenOnPort: Int){
        self.listenOnPort = listenOnPort
    }

    public func runForever() throws {
        let listeningSocket = try Socket.create()
        try listeningSocket.listen(on: self.listenOnPort)

        repeat {
            let incommingSocket = try listeningSocket.acceptClientConnection()
            var buffer = Data(capacity: 1024)
            let bytesRead = try incommingSocket.read(into: &buffer)
            let  text = String(data: buffer, encoding: .utf8)!
            if(bytesRead > 0){
            let request = try RequestParser.parse(rawRequest:text)
            print(request)
            }

        } while true
    }
}