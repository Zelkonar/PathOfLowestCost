import XCTest

class ShortestPathFinderTest: XCTestCase {
  var shortestPathFinder = ShortestPathFinder()
  
  func testAddRowASimpleRow() {
    shortestPathFinder.addRow("1")
    
    XCTAssertEqual(shortestPathFinder.board, [1])
  }
  
  func testAddRowWithTwoValues() {
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.board, [2, 3])
  }
  
  func testAddRowUpdatesRowAttribute() {
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.rows, 1)
  }
}
