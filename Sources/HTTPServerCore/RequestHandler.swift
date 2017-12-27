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
            return handlePost(request: request)!

        default:
            return Response(
                    httpVersion: "",
                    statusCode: 1,
                    statusPhrase: "",
                    headers: ["key": ""],
                    body: ""
            )

        }
    }

    func handleGet(request: Request) -> Response {

        let resourceResolvers = [
            self.tryFetchDirectory,
            self.tryFetchFile,
        ]

        for resolver in resourceResolvers {
            let response = resolver(request)
            if response != nil {
                return response!
            }

        }

        return resourceNotFound(request: request)

    }

    func handlePost(request: Request) -> Response? {
        return nil
    }

    func tryFetchDirectory(request: Request) -> Response? {
        do {
            let filesAndFileTypes = try self.directoryNavigator.listFilesAndFileTypes(atPath: request.resource)
            return Response(
                    httpVersion: request.httpVersion,
                    statusCode: 200,
                    statusPhrase: "OK",
                    headers: request.headers,
                    body: HTMLBuilder.directoryListingToHTML(
                            resourcePath: request.resource,
                            filenamesAndType: filesAndFileTypes
                    )
            )
        } catch {
            return nil
        }
    }

    func tryFetchFile(request: Request) -> Response? {
        do {
            let data = try self.directoryNavigator.readFileContents(atPath: request.resource)
            return Response(
                    httpVersion: request.httpVersion,
                    statusCode: 200,
                    statusPhrase: "OK",
                    headers: request.headers,
                    body: String(data: data!, encoding: .utf8)
            )


        } catch {
            print(error)
            return nil
        }
    }

    func resourceNotFound(request: Request) -> Response {
        return Response(
                httpVersion: request.httpVersion,
                statusCode: 404,
                statusPhrase: "Not Found",
                headers: request.headers,
                body: "Resource \(request.resource) does not exist"
        )
    }

}