import XCTest

class TileTest: XCTestCase {
  
  func testInitialValueIsZero(){
    let tile = Tile()
    
    XCTAssertEqual(tile.value, 0)
  }
  
  func testTileContainsValueSet(){
    let tile = Tile(value: 1)
    
    XCTAssertEqual(tile.value, 1)
  }
}
