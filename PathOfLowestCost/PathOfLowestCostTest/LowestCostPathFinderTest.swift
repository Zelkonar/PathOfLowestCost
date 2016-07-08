import XCTest

class LowestCostPathFinderTest: XCTestCase {
  
  func testLowestCostPathFinderHasInitializerForBoard(){
    let board = Board()
    board.addRow("1")
    board.addRow("2")
    
    let lowestCostPathFinder = LowestCostPathFinder(board: board)
    
    XCTAssert(lowestCostPathFinder.board === board)
  }
  
  func testMadeItToEndOfBoardIsInitiallyFalse(){
    let lowestCostPathFinder = LowestCostPathFinder()
    
    XCTAssertFalse(lowestCostPathFinder.madeToOtherSideOfBoard)
  }
  
  func testTotalCostInitiallyZero(){
    let lowestCostPathFinder = LowestCostPathFinder()
    
    XCTAssertNil(lowestCostPathFinder.lowestTotalCost)
  }
}