//
//  RequestParser.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/23/17.
//

import Foundation


public final class RequestParser {

    
    public static func  parse(rawRequest text: String) throws -> [String] {

        guard !text.isEmpty else {
            throw RequestParsingError.emptyRequest
        }
        return getLines(text: text)
    }
    
    static func getLines(text: String) -> [String] {
        return text.components(separatedBy: CharacterSet(charactersIn: "\r,\n"))
     
    }

}

public enum RequestParsingError: Error {
    case emptyRequest
}
