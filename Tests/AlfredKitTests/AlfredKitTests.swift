import XCTest
@testable import AlfredKit

class AlfredKitTests: XCTestCase {

    func testEnvironmentVariables() {

        let alfred = Alfred()
        XCTAssertTrue(alfred.items.isEmpty)

        let currentDir = alfred.fileManager.currentDirectoryPath
        XCTAssertFalse(currentDir.isEmpty)
        print("currentDir: \(currentDir)")
        let process = ProcessInfo.processInfo
        print("""
            ARGUMENTS:
            \(process.arguments)
            """)
    }


    static var allTests = [
        ("testEnvironmentVariables", testEnvironmentVariables),
    ]
}
