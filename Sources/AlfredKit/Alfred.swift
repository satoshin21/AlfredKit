//
//  Alfred.swift
//  AlfredKitPackageDescription
//
//  Created by Satoshi Nagasaka on 2017/10/09.
//

import Foundation

public class Alfred {

    let fileManager = FileManager()

    private(set) var items = [Item]()

    private let currentURL: URL
    private let cacheURL: URL
    private let dataURL: URL

    init() {

        // Environment Variables
        currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        cacheURL = currentURL.appendingPathComponent("cache", isDirectory: true)
        dataURL = currentURL.appendingPathComponent("data", isDirectory: true)

        if !fileManager.fileExists(atPath: cacheURL.absoluteString) {
            try? fileManager.createDirectory(at: cacheURL, withIntermediateDirectories: true, attributes: nil)
        }

        if !fileManager.fileExists(atPath: dataURL.absoluteString) {
            try? fileManager.createDirectory(at: dataURL, withIntermediateDirectories: true, attributes: nil)
        }
    }

    public func add(item: Item) {

        items.append(item)
    }

    public func export() {

        let items = self.items.map({$0.xml}).reduce("")
        { (res, item) -> String in
            res + item
        }
        print("<items>\(items)</items>")
    }

    public struct Item {

        let id: String
        let argument: String
        let title: String
        let subTitle: String
        let icon: String
        let isValid: Bool
        let autocomplete: String = ""
        let rType: String = ""

        var xml: String {

            return """
            <item uidid='\(id)'
            valid='\(isValid ? "yes" : "no")'
            autocomplete='\(autocomplete)'
            type='\(rType)'>
                <arg>\(argument)</arg>
                <title>\(title)</title>
                <sub>\(subTitle)</sub>
                <icon>\(icon)</icon>
            </item>
            """
        }
    }
}
