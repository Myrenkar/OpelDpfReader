import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OBD2ConnectionTests.allTests),
    ]
}
#endif
