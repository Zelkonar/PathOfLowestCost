import XCTest

class LowestCostPathFinderTest: XCTestCase {
  var lowestCostPathFinder = LowestCostPathFinder()
  var board = Board()
  
  func testBoardIsInitiallyNil(){
    XCTAssertNil(lowestCostPathFinder.board)
  }
  
  func testLowestCostPathFinderHasInitializerForBoard(){
    board.addRow("1")
    board.addRow("2")
    
    lowestCostPathFinder = LowestCostPathFinder(board: board)
    
    XCTAssert(lowestCostPathFinder.board === board)
  }
  
  func testMadeItToEndOfBoardIsInitiallyFalse(){
    XCTAssertFalse(lowestCostPathFinder.path.madeToOtherSideOfBoard)
  }
  
  func testTotalCostInitiallyZero(){
    XCTAssertNil(lowestCostPathFinder.path.lowestTotalCost)
  }
  
  func testLowestPathInitiallyNil(){
    XCTAssertNil(lowestCostPathFinder.path.pathOfLowestCost)
  }
  
  func testFindLowestPathWithSimpleBoard(){
    board.addRow("1")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertTrue(lowestCostPathFinder.path.madeToOtherSideOfBoard)
    XCTAssertEqual(lowestCostPathFinder.path.lowestTotalCost, 1)
    XCTAssertEqual(lowestCostPathFinder.path.pathOfLowestCost!, [1])
  }
  
  func testFindLowestPathWith2ColumnBoard(){
    board.addRow("1 2")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertTrue(lowestCostPathFinder.path.madeToOtherSideOfBoard)
    XCTAssertEqual(lowestCostPathFinder.path.lowestTotalCost, 3)
    XCTAssertEqual(lowestCostPathFinder.path.pathOfLowestCost!, [1, 1])
  }
  
  func testFindLowetsPathThatDoesntCrossASingleTile(){
    board.addRow("50")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertFalse(lowestCostPathFinder.path.madeToOtherSideOfBoard)
    XCTAssertNil(lowestCostPathFinder.path.lowestTotalCost)
    XCTAssertNil(lowestCostPathFinder.path.pathOfLowestCost)
  }
}