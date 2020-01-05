import XCTest
@testable import OBD2Connection

final class OBD2ConnectionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(OBD2Connection().host, "192.168.0.10")
        XCTAssertEqual(OBD2Connection().port, 35000)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
