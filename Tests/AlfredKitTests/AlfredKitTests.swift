import XCTest
@testable import AlfredKit

class AlfredKitTests: XCTestCase {

    func testEnvironmentVariables() {

        let alfred = Alfred()
        XCTAssertTrue(alfred.items.isEmpty)

        
        let currentDir = alfred.fileManager.currentDirectoryPath
        XCTAssertFalse(currentDir.isEmpty)
        print("currentDir: \(currentDir)")

        let jsonEncoder = JSONEncoder()
        var items = [Item]()
        items.append(Item(title: "foo"))
        items.append(Item(title: "bar", type: .file))

        let encoded = try! jsonEncoder.encode(items)
        let encodedString = String(data: encoded, encoding: .utf8 )
        print(encodedString!)
    }

    static var allTests = [
        ("testEnvironmentVariables", testEnvironmentVariables),
    ]
}
