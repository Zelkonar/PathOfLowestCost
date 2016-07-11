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
  
  private func createTile(value value: Int = 0, column: Int = 0) -> Tile{
    return Tile(value: value, column: column)
  }
}
