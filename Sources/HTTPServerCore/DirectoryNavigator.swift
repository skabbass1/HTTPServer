//
//  DirectoryNavigator.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/29/17.
//

import Foundation

public enum DirectoryNavigatorError: Error {
    case pathDoesNotExist
}

public  final class DirectoryNavigator {
    
    let fileManager: FileManager
    let root: String
    
    public init(){
        self.fileManager = FileManager()
        self.root = fileManager.currentDirectoryPath
    }
    
    public func listFiles(atPath: String) throws -> [String]{
        do {
            return try self.fileManager.contentsOfDirectory(atPath: "\(root)\(atPath)")
        }
        catch  _ as NSError {
            throw DirectoryNavigatorError.pathDoesNotExist
        }
        
    }
    
}
