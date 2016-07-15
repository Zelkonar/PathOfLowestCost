import XCTest

class PathTest: XCTestCase {
  
  func testEquatableWhenEqual(){
    let path1 = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 5, pathOfLowestCost: [4])
    let path2 = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 5, pathOfLowestCost: [4])
    
    XCTAssertTrue(path1 == path2)
  }
  
  func testEquatableWhenNotEqual(){
    let path1 = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 5, pathOfLowestCost: [4, 4, 4])
    let path2 = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 7, pathOfLowestCost: [4])
    
    XCTAssertFalse(path1 == path2)
  }
  
}
