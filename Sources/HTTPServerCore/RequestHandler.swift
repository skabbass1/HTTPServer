//
// Created by Syed Abbas on 12/10/17.
//

import Foundation

public final class RequestHandler {

    let directoryNavigator: DirectoryNavigator

    public init() {
        self.directoryNavigator = DirectoryNavigator()
    }

    public func handleRequest(request: Request) -> Response {

        switch request.method {
        case "GET":
            return handleGet(request: request)

        case "POST":
            return handlePost(request: request)

        default:
            return Response()
        }
    }

    func handleGet(request: Request) -> Response {

        let resourceResolvers = [
            self.tryFetchDirectory,
            self.tryFetchFile,
        ]

        return Response()
    }

    func handlePost(request: Request) -> Response {
        return Response()
    }

    func tryFetchDirectory(atPath: String) -> Response? {
        return nil
    }

    func tryFetchFile(atPath: String) -> Response? {
        return nil
    }

    func resourceNotFound() -> Response {
        return Response()
    }

}