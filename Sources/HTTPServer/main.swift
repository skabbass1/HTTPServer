import HTTPServerCore

import Foundation

import Socket

let mySocket = try Socket.create()
try mySocket.listen(on:5000)

repeat {
    let newSocket = try mySocket.acceptClientConnection()
     print("Accepted connection from: \(newSocket.remoteHostname) on port \(newSocket.remotePort)")
    var readData = Data(capacity: 1024)
    let bytesRead = try newSocket.read(into: &readData)
    let response = String(data: readData, encoding: .utf8)
    print(response)

    
    
} while true
