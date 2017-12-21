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
                        "User-Agent": "Chrome/61.0.3163.100 Safari/537.36",
                        "Referer": "http://localhost:8000/",
                        "Accept-Encoding": "gzip, deflate, br"
                    ])

            let expectedResponse = "HTTP/1.1 404 Not Found\r\n\r\nResource /Does/Not/Exist does not exist"
            let requestHandler = RequestHandler()
            let response = requestHandler.handleRequest(request: incommingRequest)
            expect(response.stringify()).to(equal(expectedResponse))
        }
    }
}
