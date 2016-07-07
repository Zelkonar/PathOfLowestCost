import XCTest

class ShortestPathFinderTest: XCTestCase {
  func testShortestPathCanAddASimpleRow() {
    let shortestPathFinder = ShortestPathFinder()
    
    shortestPathFinder.addRow("1")
    
    XCTAssertEqual(shortestPathFinder.board, [1])
  }
}
