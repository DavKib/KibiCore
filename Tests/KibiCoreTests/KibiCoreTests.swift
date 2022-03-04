import XCTest
@testable import KibiCore

final class KibiCoreTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var kibiTest = Test()
        kibiTest.setTitle("Test")
        XCTAssertEqual(kibiTest.getTitle(), "Test")
    }
}
