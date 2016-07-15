import XCTest

class BoardTests: XCTestCase {
  var board = Board()
  
  func testAddRowASimpleRow(){
    let expected = buildTileArray([1], columns: [1], rows: [1])
    
    board.addRow("1")
    
    XCTAssertEqual(board.tiles, expected)
  }
  
  func testAddRowWithTwoValues(){
    let expected = buildTileArray([2, 3], columns: [1, 2], rows: [1, 1])
    
    board.addRow("2 3")
    
    XCTAssertEqual(board.tiles, expected)
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
    let expected = buildTileArray([1, 2, 3], columns: [1, 2, 3], rows: [1, 1, 1])
    
    board.addRow("1 2 3")
    
    XCTAssertEqual(board.tiles, expected)
  }
  
  func testAddRowAddsCorrectRowToTiles(){
    let expected = buildTileArray([1, 2, 3, 4, 5, 6], columns: [1, 2, 3, 1, 2, 3], rows: [1, 1, 1, 2, 2, 2])
    
    board.addRow("1 2 3")
    board.addRow("4 5 6")
    
    XCTAssertEqual(board.tiles, expected)
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
  
  private func buildTileArray(values: [Int], columns: [Int], rows: [Int]) -> [Tile]{
    var result = [Tile]()
    
    for index in 0...values.endIndex - 1{
      result.append(createTile(value: values[index], column: columns[index], row: rows[index]))
    }
    
    return result
  }
  
  private func createTile(value value: Int = 0, column: Int = 0, row: Int = 0) -> Tile{
    return Tile(value: value, column: column, row: row)
  }
}
