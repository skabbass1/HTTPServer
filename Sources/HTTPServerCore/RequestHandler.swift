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

    func handleGet(request: Request) -> Response{
        //resources = self.directoryNavigator.
        return Response()
    }

    func handlePost(request: Request) -> Response {
        return Response()
    }
}