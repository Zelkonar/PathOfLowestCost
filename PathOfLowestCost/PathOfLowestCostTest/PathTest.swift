import XCTest

class PathTest: XCTestCase {
  
  func testEquatableWhenEqual(){
    let path1 = Path(true, 5, [4])
    let path2 = Path(true, 5, [4])
    
    XCTAssertTrue(path1 == path2)
  }
  
  func testEquatableWhenNotEqual(){
    let path1 = Path(false, 5, [4, 4, 4])
    let path2 = Path(true, 7, [4])
    
    XCTAssertFalse(path1 == path2)
  }
  
}
