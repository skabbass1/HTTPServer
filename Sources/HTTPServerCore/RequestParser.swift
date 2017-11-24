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
    
    
    public static func  parse(rawRequest text: String) throws -> [String] {
        
        guard !text.isEmpty else {
            throw RequestParsingError.emptyRequest
        }
        let lines = getLines(text: text)
        let (method, request, version) = try parseRequestLine(line: lines[0])
        return lines
    }
    
    static func getLines(text: String) -> [String] {
        return text.components(separatedBy: CharacterSet(charactersIn: "\r,\n"))
        
    }
    
    static func parseRequestLine(line: String) throws -> (method: String, resource: String, version:String?) {
        
        let words = line.components(separatedBy: " ").filter {$0 != ""}
        
        guard (words.count >= 2 && words.count <= 3) else {
            throw RequestParsingError.badRequestSyntax
        }
        
        return (method: words[0], resource: words[1], version: 2 < words.count ? words[2]: nil)
    }
    
    static func parseRequestHeaders(lines: [String]) -> [String: String] {
        return [
            "a": "B",
        ]
    }
    
}


