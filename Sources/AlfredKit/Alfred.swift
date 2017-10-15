//
//  Alfred.swift
//  AlfredKitPackageDescription
//
//  Created by Satoshi Nagasaka on 2017/10/09.
//

import Foundation


public extension Array where Element == Alfred.Item {

    @discardableResult
    public func export() throws -> String {

        let output = ["items": self]

        let jsonEncoder = JSONEncoder()

        guard let json = try? jsonEncoder.encode(output) else {
            throw Error.jsonEncode
        }

        guard let encodedString = String(data: json, encoding: .utf8) else {
            throw Error.stringEncode
        }

        print(encodedString)
        return encodedString
    }

    enum Error: Swift.Error {
        case jsonEncode
        case stringEncode
    }
}
