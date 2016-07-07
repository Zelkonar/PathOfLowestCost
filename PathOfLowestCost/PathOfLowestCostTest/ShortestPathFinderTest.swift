import XCTest

class ShortestPathFinderTest: XCTestCase {
  var shortestPathFinder = ShortestPathFinder()
  
  func testAddRowASimpleRow(){
    shortestPathFinder.addRow("1")
    
    XCTAssertEqual(shortestPathFinder.board, [1])
  }
  
  func testAddRowWithTwoValues(){
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.board, [2, 3])
  }
  
  func testAddRowUpdatesRowAttribute(){
    shortestPathFinder.addRow("2 3")
    
    XCTAssertEqual(shortestPathFinder.rows, 1)
  }
  
  func testAddRowTwiceUpdatesRowAttributeToTwo(){
    shortestPathFinder.addRow("1 2")
    shortestPathFinder.addRow("3 4")
    
    XCTAssertEqual(shortestPathFinder.rows, 2)
  }
  
  func testColumnAttributeInitiallyZero(){
    XCTAssertEqual(shortestPathFinder.columns, 0)
  }
  
  func testAddRowUpdatesColumnAttribute(){
    shortestPathFinder.addRow("1")
    
    XCTAssertEqual(shortestPathFinder.columns, 1)
  }
}
