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
    
    public func fileExists(atPath: String) -> Bool {
        return  self.fileManager.fileExists(atPath: atPath)
    }
    
    public func fileType(atPath: String) throws -> String {
        guard  fileExists(atPath: atPath) else {
            throw DirectoryNavigatorError.pathDoesNotExist
        }
         return try fileManager.attributesOfItem(atPath: atPath)[FileAttributeKey("NSFileType")] as! String
    
    }
    
    public func readFileContents(atPath: String) throws -> Data? {
        guard  fileExists(atPath: atPath) else {
            throw DirectoryNavigatorError.pathDoesNotExist
        }
    
        let file: FileHandle? = FileHandle(forReadingAtPath: atPath)
        return file?.readDataToEndOfFile()
        
    }
}
