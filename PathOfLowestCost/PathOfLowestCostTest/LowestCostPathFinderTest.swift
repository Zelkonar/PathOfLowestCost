import XCTest

class LowestCostPathFinderTest: XCTestCase {
  var lowestCostPathFinder = LowestCostPathFinder()
  
  func testBoardIsInitiallyNil(){
    XCTAssertNil(lowestCostPathFinder.board)
  }
  
  func testLowestCostPathFinderHasInitializerForBoard(){
    let board = Board()
    board.addRow("1")
    board.addRow("2")
    
    lowestCostPathFinder = LowestCostPathFinder(board: board)
    
    XCTAssert(lowestCostPathFinder.board === board)
  }
  
  func testMadeItToEndOfBoardIsInitiallyFalse(){
    XCTAssertFalse(lowestCostPathFinder.madeToOtherSideOfBoard)
  }
  
  func testTotalCostInitiallyZero(){
    XCTAssertNil(lowestCostPathFinder.lowestTotalCost)
  }
  
  func testLowestPathInitiallyNil(){
    XCTAssertNil(lowestCostPathFinder.pathOfLowestCost)
  }
  
  func testFindLowestPathWithSimpleBoard(){
    let board = Board()
    board.addRow("1")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertTrue(lowestCostPathFinder.madeToOtherSideOfBoard)
    XCTAssertEqual(lowestCostPathFinder.lowestTotalCost, 1)
    XCTAssertEqual(lowestCostPathFinder.pathOfLowestCost!, [1])
  }
}