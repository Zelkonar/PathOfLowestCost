import XCTest

class TileTest: XCTestCase {
  
  func testInitialValueIsZero(){
    let tile = Tile()
    
    XCTAssertEqual(tile.value, 0)
  }
}
