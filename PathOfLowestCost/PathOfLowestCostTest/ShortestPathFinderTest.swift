import XCTest

class ShortestPathFinderTest: XCTestCase {
  
  func testAddRowASimpleRow() {
    let shortestPathFinder = ShortestPathFinder()
    
    shortestPathFinder.addRow("1")
    
    XCTAssertEqual(shortestPathFinder.board, [1])
  }
  
  func testAddRowWithTwoValues() {
    let shortestPathFinder = ShortestPathFinder()
    
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.board, [2, 3])
  }
  
  func testAddRowUpdatesRowAttribute() {
    let shortestPathFinder = ShortestPathFinder()
    
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.rows, 1)
  }
}
