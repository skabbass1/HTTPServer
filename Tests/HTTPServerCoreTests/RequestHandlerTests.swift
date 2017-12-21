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

        it("It returns 404 Not Found  when resource does not exist") {


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
    }
}
