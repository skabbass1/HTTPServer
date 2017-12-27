//
//  DirectoryNavigator.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/29/17.
//

import Foundation

public enum DirectoryNavigatorError: Error {
    case pathDoesNotExist(path: String)
}

public  final class DirectoryNavigator {
    
    let fileManager: FileManager
    let root: String
    
    public init(){
        self.fileManager = FileManager()
        self.root = fileManager.currentDirectoryPath
    }
    
    public func listFilesAndFileTypes(atPath: String) throws -> [(name: String, path: String, type: String)]{
        var itemNames: [String]
        do {
            itemNames = try self.fileManager.contentsOfDirectory(atPath: "\(root)\(atPath)").sorted(by: <)
        }
        catch  {
            throw DirectoryNavigatorError.pathDoesNotExist(path: atPath)
        }

        let path = atPath == "/" ? "": atPath
        return try itemNames.map {($0, "\(path)/\($0)",  try self.fileType(atPath: "\(root)\(path)/\($0)"))}
    }
    
    public func fileExists(atPath: String) -> Bool {
        return  self.fileManager.fileExists(atPath: atPath)
    }
    
    public func fileType(atPath: String) throws -> String {
        guard  fileExists(atPath: atPath) else {
            throw DirectoryNavigatorError.pathDoesNotExist(path:atPath)
        }
         return try fileManager.attributesOfItem(atPath: atPath)[FileAttributeKey("NSFileType")] as! String
    
    }
    
    public func readFileContents(atPath: String) throws -> Data? {
        guard  fileExists(atPath: atPath) else {
            throw DirectoryNavigatorError.pathDoesNotExist(path: atPath)
        }
    
        let file: FileHandle? = FileHandle(forReadingAtPath: atPath)
        return file?.readDataToEndOfFile()
        
    }
}
