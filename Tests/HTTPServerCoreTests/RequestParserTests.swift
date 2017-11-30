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


class RequestParserSpec: QuickSpec {
    override func spec() {
        it("Throws empty request error when request text is empty") {
            let rawRequest = String()
            expect {try RequestParser.parse(rawRequest: rawRequest)}.to(throwError(RequestParsingError.emptyRequest))
        }
        
        it("Throws bad request syntax error for malformed request line"){
            let rawRequest = "GET "
            expect {try RequestParser.parse(rawRequest: rawRequest)}.to(throwError(RequestParsingError.badRequestSyntax))
        }
        
        it("Parses valid GET request correctly") {
            let rawRequest = """
                GET /Tests/ HTTP/1.1
                Host: localhost:8000
                User-Agent: Chrome/61.0.3163.100 Safari/537.36
                Accept: text/html
                Referer: http://localhost:8000/
                Accept-Encoding: gzip, deflate, br

            """
            
            let expected = Request(
                method: "GET",
                resource: "/Tests/",
                httpVersion: Optional("HTTP/1.1"),
                headers: [
                    "Host": "localhost:8000",
                    "Accept": "text/html",
                    "User-Agent":"Chrome/61.0.3163.100 Safari/537.36",
                    "Referer": "http://localhost:8000/",
                    "Accept-Encoding": "gzip, deflate, br"
                ])
            
            do {
                let parsedRequest = try RequestParser.parse(rawRequest: rawRequest)
                expect(parsedRequest).to(equal(expected))
            }
            catch {
        }
        
    }
}
}
