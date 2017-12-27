//
// Created by Syed Abbas on 12/26/17.
//

import Foundation

public final class HTMLBuilder {

    public static func directoryListingToHTML(
            resourcePath: String,
            filenamesAndType: [(name: String, path: String, type: String)]) -> String {
        return extendBaseTemplate(resourcePath: resourcePath, fileNamesAndTypes: filenamesAndType)
    }

    static func extendBaseTemplate(
            resourcePath: String,
            fileNamesAndTypes: [(name: String, path: String, type: String)]) -> String {

        let list = fileNamesAndTypes.map({ (item) in
            let (name, path, type) = item
            let displayName = type == "NSFileTypeDirectory" ? name + "/" : name
            return "<li><a href=\(path)>\(displayName)</a>"
        }).joined()

        return """
        <html>
        <title>Directory listing for \(resourcePath)</title>
        <body>
        <h2>Directory listing for \(resourcePath)</h2>
        <hr>
        <ul>\(list)</ul>
        <hr>
        </body>
        </html>
        """.replacingOccurrences(of: "\n", with: "")
    }
}