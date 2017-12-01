//
//  RequestParser.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/23/17.
//

import Foundation


public enum RequestParsingError: Error {
    case emptyRequest
    case badRequestSyntax
}

public final class RequestParser {
    
    public static func  parse(rawRequest text: String) throws -> Request {
        guard !text.isEmpty else {
            throw RequestParsingError.emptyRequest
        }
        var lines = getLines(text: text)
        let (method, resource, httpVersion) = try parseResourceLine(line: lines.removeFirst())
        let headers = parseRequestHeaders(lines: lines)
        return Request(
            method: method,
            resource:resource,
            httpVersion: httpVersion,
            headers: headers
        )
    }
    
    static func getLines(text: String) -> [String] {
        return text.components(separatedBy: CharacterSet(charactersIn: "\r\n"))
        
    }
    
    static func parseResourceLine(line: String) throws -> (method: String, resource: String, version:String?) {
        let words = line.components(separatedBy: " ").filter {$0 != ""}
        guard (words.count >= 2 && words.count <= 3) else {
            throw RequestParsingError.badRequestSyntax
        }
        return (
            method: words[0],
            resource: words[1],
            version: 2 < words.count ? words[2]: nil
        )
    }
    
    static func parseRequestHeaders(lines: [String]) -> [String: String] {
        var headers = [String: String]()
        for line in lines {
            if (line.isEmpty){
                break
            }
            let keyValue = line.split(separator: ":", maxSplits: 1).map{$0.trimmingCharacters(in: .whitespaces)}
            headers[keyValue[0]] = keyValue[1]
        }
        
        return headers
    }
}


