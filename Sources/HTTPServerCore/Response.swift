//
// Created by Syed Abbas on 12/10/17.
//

import Foundation

public struct Response {
    let httpVersion: String
    let statusCode: Int
    let statusPhrase: String
    let headers: [String: String]
    let body: String?

    public init(
            httpVersion: String,
            statusCode: Int,
            statusPhrase: String,
            headers: [String: String],
            body: String?
    ) {
        self.httpVersion = httpVersion
        self.statusCode = statusCode
        self.statusPhrase = statusPhrase
        self.headers = headers
        self.body = body
    }

    public func stringify() -> String {
        let firstLine = "\(self.httpVersion) \(self.statusCode) \(self.statusPhrase)"
        let headers = self.headers.map({
            (key: String, value: String) -> String in
            return "\(key): \(value)\r\n"
        }).joined()

        return "\(firstLine)\r\n\(headers)\r\n\(self.body!)"
    }

}

extension Response: Equatable {
    public static func == (lhs: Response, rhs: Response) -> Bool {
        return
            lhs.httpVersion == rhs.httpVersion &&
            lhs.statusCode == rhs.statusCode &&
            lhs.statusPhrase == rhs.statusPhrase &&
            lhs.headers == rhs.headers &&
            lhs.body! == rhs.body!
    }
}
