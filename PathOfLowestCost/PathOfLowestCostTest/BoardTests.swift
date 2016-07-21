import XCTest

class BoardTests: XCTestCase {
  var board = Board()
  
  func testAddRowASimpleRow(){
    let expected = [[Int]](arrayLiteral: [1])
    
    board.addRow("1")
    
    XCTAssertEqual(board.grid, expected)
  }
  
  func testAddRowWithTwoValues(){
    let expected = [[Int]](arrayLiteral: [2, 3])
    
    board.addRow("2 3")
    
    XCTAssertEqual(board.grid, expected)
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
  
  func testAddRowAddsCorrectColumnToTiles(){
    let expected = [[Int]](arrayLiteral: [1, 2, 3])
    
    board.addRow("1 2 3")
    
    XCTAssertEqual(board.grid, expected)
  }
  
  func testAddRowAddsCorrectRowToTiles(){
    let expected = [[Int]](arrayLiteral: [1, 2, 3], [4, 5, 6])
    
    board.addRow("1 2 3")
    board.addRow("4 5 6")
    
    XCTAssertEqual(board.grid, expected)
  }

  func testEquatableWhenEqual(){
    let board1 = Board()
    let board2 = Board()
    
    board1.addRow("1 2")
    board2.addRow("1 2")
    
    XCTAssertTrue(board1 == board2)
  }
  
  func testEquatableWhenNotEqual(){
    let board1 = Board()
    let board2 = Board()
    
    board1.addRow("1 2")
    board2.addRow("2 3")
    
    XCTAssertFalse(board1 == board2)
  }
}
