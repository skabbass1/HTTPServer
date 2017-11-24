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






//let rawRequest = """
//GET /Tests/ HTTP/1.1
//Host: localhost:8000
//Connection: keep-alive
//Pragma: no-cache
//Cache-Control: no-cache
//User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36
//Upgrade-Insecure-Requests: 1
//Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
//Referer: http://localhost:8000/
//Accept-Encoding: gzip, deflate, br
//Accept-Language: en-US,en;q=0.8,vi;q=0.6
//"""





class RequestParserSpec: QuickSpec {
    override func spec() {
        it("Throws error when request text is empty") {
            
            let rawRequest = String()
            expect {try RequestParser.parse(rawRequest: rawRequest)}.to(throwError(RequestParsingError.emptyRequest))
        
        }
    }
}
