//
//  DirectoryNavigatorTests.swift
//  HTTPServerPackageDescription
//
//  Created by Syed Abbas on 11/30/17.
//

import Foundation
import Quick
import Nimble
import HTTPServerCore

class DirectoryNavigatorSpec: QuickSpec {
    override func spec() {
        describe("listFiles method"){
            it("throws when invalid path provided"){
                let navigator = DirectoryNavigator()
                expect {try navigator.listFiles(atPath: "does_not_exist")}.to(throwError(DirectoryNavigatorError.pathDoesNotExist))
            }
        }
        describe("fileType method"){
            it("throws when invalid path provided"){
                let navigator = DirectoryNavigator()
                expect {try navigator.fileType(atPath: "does_not_exist")}.to(throwError(DirectoryNavigatorError.pathDoesNotExist))
            }
        }
        describe("readFileContents method"){
            it("throws when invalid path provided"){
                let navigator = DirectoryNavigator()
                expect {try navigator.readFileContents(atPath: "does_not_exist")}.to(throwError(DirectoryNavigatorError.pathDoesNotExist))
            }
            it("returns nil when path is a directory"){
                
                let fileManager = FileManager()
                let navigator = DirectoryNavigator()
                do{
                    try fileManager.createDirectory(atPath:"tmp_dir", withIntermediateDirectories: true, attributes: nil)
                    expect {try navigator.readFileContents(atPath: "tmp_dir")}.to(beNil())
                    try fileManager.removeItem(atPath: "tmp_dir")
                    
                }
                catch {
                    print(error)
                }
                
            }
        }
    }
}
