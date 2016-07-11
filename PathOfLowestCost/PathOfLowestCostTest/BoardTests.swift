import XCTest

class BoardTests: XCTestCase {
  var board = Board()
  
  func testAddRowASimpleRow(){
    let expected = buildTileArray([1], columns: [1])
    
    board.addRow("1")
    
    XCTAssertEqual(board.tiles, expected)
  }
  
  func testAddRowWithTwoValues(){
    let expected = buildTileArray([2, 3], columns: [1, 2])
    
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
  
  func testAddingRowAddsCorrectColumn(){
    let expected = buildTileArray([1, 2, 3], columns: [1, 2, 3])
    
    board.addRow("1 2 3")
    
    XCTAssertEqual(board.tiles, expected)
  }
  
  private func buildTileArray(values: [Int], columns: [Int]) -> [Tile]{
    var result = [Tile]()
    
    for index in 0...values.endIndex - 1{
      result.append(createTile(value: values[index], column: columns[index]))
    }
    
    return result
  }
  
  private func createTile(value value: Int = 0, column: Int = 0) -> Tile{
    return Tile(value: value, column: column)
  }
}
