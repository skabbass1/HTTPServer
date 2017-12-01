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
        it("It throws when invalid directory provided"){
            let navigator = DirectoryNavigator()
            expect {try navigator.listFiles(atPath: "/sabbas")}.to(throwError(DirectoryNavigatorError.pathDoesNotExist))
        }
    }
}
