import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	[testCase(TextViewTests.allTests)]
}
#endif
