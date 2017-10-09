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

    public init() {

        // Environment Variables
        currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        cacheURL = currentURL.appendingPathComponent("cache", isDirectory: true)
        dataURL = currentURL.appendingPathComponent("data", isDirectory: true)

//        if !fileManager.fileExists(atPath: cacheURL.absoluteString) {
//            try? fileManager.createDirectory(at: cacheURL, withIntermediateDirectories: true, attributes: nil)
//        }
//
//        if !fileManager.fileExists(atPath: dataURL.absoluteString) {
//            try? fileManager.createDirectory(at: dataURL, withIntermediateDirectories: true, attributes: nil)
//        }
    }

    public func add(item: Item) {

        items.append(item)
    }

    public func export() throws {

        let output = ["items": items]

        let jsonEncoder = JSONEncoder()
        do {

            let json = try jsonEncoder.encode(output)

            guard let encodedString = String(data: json, encoding: .utf8) else {

                throw Error.stringEncode
            }

            print(encodedString)

        } catch let e {

            throw Error.jsonEncode(rawError: e)
        }
    }


    enum Error: Swift.Error {
        case jsonEncode(rawError: Swift.Error)
        case stringEncode
    }
}
