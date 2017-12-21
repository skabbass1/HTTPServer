//
//  Request.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/29/17.
//

import Foundation


public struct Request {
    let method: String
    let resource: String
    let httpVersion: String
    let headers: [String: String]
    
    public init(
        method: String,
        resource: String,
        httpVersion: String,
        headers: [String: String]
        ){
        
        self.method = method
        self.resource = resource
        self.httpVersion = httpVersion
        self.headers = headers
    }
}

extension Request: Equatable {
    
    public static func == (lhs: Request, rhs: Request) -> Bool {
        return
            lhs.method == rhs.method &&
            lhs.resource == rhs.resource &&
            lhs.httpVersion == rhs.httpVersion &&
            lhs.headers == rhs.headers
    }
}
