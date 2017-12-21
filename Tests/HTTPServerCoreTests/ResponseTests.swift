//
// Created by Syed Abbas on 12/21/17.
//

import Foundation

import Foundation
import Quick
import Nimble
import HTTPServerCore

class ResponseSpec: QuickSpec {
    override func spec() {
        it("Constructs the correct response string") {
            let response = Response(
                    httpVersion: "HTTP/1.1",
                    statusCode: 200,
                    statusPhrase: "OK",
                    headers: ["Content-Type": "text/html", "Content-Length": "10"],
                    body: Optional("Hello World")
            )

            let expected = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Length: 10\r\n\r\nHello World"
            let got = response.stringify()
            expect(got).to(equal(expected))
        }
    }
}