import XCTest

class TileTest: XCTestCase {
  
  func testTileContainsValueSet(){
    let tile = createTile(value: 1)
    
    XCTAssertEqual(tile.value, 1)
  }
  
  func testTileContainsColumnSet(){
    let tile = createTile(column: 2)
    
    XCTAssertEqual(tile.column, 2)
  }
  
  func testTileContainsRowSet(){
    let tile = createTile(row: 3)
    
    XCTAssertEqual(tile.row, 3)
  }
  
  func testEquatableWhenEqual(){
    let tile1 = Tile(1, 2, 3)
    let tile2 = Tile(1, 2, 3)
    
    XCTAssertTrue(tile1 == tile2)
  }
  
  func testEquatableWhenNotEqual(){
    let tile1 = Tile(2, 2, 3)
    let tile2 = Tile(1, 3, 5)
    
    XCTAssertFalse(tile1 == tile2)
  }
  
  func testEquateableWhenOnlyRowNotEqual(){
    let tile1 = Tile(2, 3, 3)
    let tile2 = Tile(2, 3, 5)
    
    XCTAssertFalse(tile1 == tile2)
  }
  
  private func createTile(value value: Int = 0, column: Int = 0, row: Int = 0) -> Tile{
    return Tile(value, column, row)
  }
}
