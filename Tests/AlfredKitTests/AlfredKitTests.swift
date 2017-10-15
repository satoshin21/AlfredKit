import XCTest
@testable import AlfredKit

class AlfredKitTests: XCTestCase {

    func testEnvironmentVariables() throws {

        var items = [Alfred.Item]()
        items.append(.init(title: "Test1"))

        let jsonEncoder = JSONEncoder()
        let json = try jsonEncoder.encode(["items": items])
        let string = String(data: json, encoding: .utf8)
        XCTAssertNotNil(string)

        let jsonObject = try JSONSerialization.jsonObject(with: json, options: .allowFragments)
        XCTAssertTrue(jsonObject is [String: Any])
        let dictionary = jsonObject as? [String: Any]
        XCTAssertNotNil(dictionary)
        guard let dict = dictionary else {
            return
        }

        let testItems = dict["items"] as? [Any]
        XCTAssertNotNil(testItems)
        XCTAssertTrue(testItems!.count == items.count)
    }

    static var allTests = [
        ("testEnvironmentVariables", testEnvironmentVariables),
    ]
}
