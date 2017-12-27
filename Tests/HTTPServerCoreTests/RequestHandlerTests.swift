//
//  RequestParserTests.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/23/17.
//

import Foundation
import Quick
import Nimble
import HTTPServerCore

class RequestHandlerSpec: QuickSpec {
    override func spec() {

        it("Returns 404 Not Found  when resource does not exist") {


            let incommingRequest = Request(
                    method: "GET",
                    resource: "/Does/Not/Exist",
                    httpVersion: "HTTP/1.1",
                    headers: [
                        "Host": "localhost:8000",
                        "Accept": "text/html",
                    ])

            let expectedResponse = Response(
                    httpVersion: "HTTP/1.1",
                    statusCode: 404,
                    statusPhrase: "Not Found",
                    headers: [ "Host": "localhost:8000", "Accept": "text/html",],
                    body: Optional("Resource /Does/Not/Exist does not exist")
            )
            let requestHandler = RequestHandler()
            let response = requestHandler.handleRequest(request: incommingRequest)
            expect(response).to(equal(expectedResponse))
        }

        it("Returns correct HTML for contents of directory") {

            let incommingRequest = Request(
                    method: "GET",
                    resource: "/Tests/TestData/",
                    httpVersion: "HTTP/1.1",
                    headers: [
                        "Host": "localhost:8000",
                        "Accept": "text/html",
                    ])

            let expectedBody = """
            <html>
            <title>Directory listing for /Tests/TestData/</title>
            <body>
            <h2>Directory listing for /Tests/TestData/</h2>
            <hr>
            <ul>
            <li><a href=/Tests/TestData//hello.txt>hello.txt</a>
            <li><a href=/Tests/TestData//test1>test1/</a>
            <li><a href=/Tests/TestData//test2>test2/</a>
            <li><a href=/Tests/TestData//world.txt>world.txt</a>
            </ul>
            <hr>
            </body>
            </html>
            """.replacingOccurrences(of: "\n", with: "")

            let expectedResponse = Response(
                    httpVersion: "HTTP/1.1",
                    statusCode: 200,
                    statusPhrase: "OK",
                    headers: [ "Host": "localhost:8000", "Accept": "text/html",],
                    body: Optional(expectedBody)
            )

            let requestHandler = RequestHandler()
            let response = requestHandler.handleRequest(request: incommingRequest)
            expect(response).to(equal(expectedResponse))
        }
    }
}
