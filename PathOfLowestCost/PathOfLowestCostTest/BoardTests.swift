import XCTest

class BoardTests: XCTestCase {
  var board = Board()
  
  func testAddRowASimpleRow(){
    board.addRow("1")
    
    XCTAssertEqual(board.tiles, [1])
  }
  
  func testAddRowWithTwoValues(){
    board.addRow("2 3")
    
    XCTAssertEqual(board.tiles, [2, 3])
  }
  
  func testAddRowUpdatesRowAttribute(){
    board.addRow("2 3")
    
    XCTAssertEqual(board.rows, 1)
  }
  
  func testAddRowTwiceUpdatesRowAttributeToTwo(){
    board.addRow("1 2")
    board.addRow("3 4")
    
    XCTAssertEqual(board.rows, 2)
  }
  
  func testColumnAttributeInitiallyZero(){
    XCTAssertEqual(board.columns, 0)
  }
  
  func testAddRowUpdatesColumnAttribute(){
    board.addRow("1")
    
    XCTAssertEqual(board.columns, 1)
  }
  
  func testAddRowUpdatesColumnAttributeToThree(){
    board.addRow("1 2 3")
    
    XCTAssertEqual(board.columns, 3)
  }
}
