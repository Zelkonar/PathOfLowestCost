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
  
  func testLowestPathInitiallyEmpty(){
    XCTAssertEqual(lowestCostPathFinder.path.pathOfLowestCost, [Int]())
  }
  
  func testFindLowestPathWithSimpleBoard(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 1, pathOfLowestCost: [1])
    board.addRow("1")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testFindLowestPathWith2ColumnBoard(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 3, pathOfLowestCost: [1, 1])
    board.addRow("1 2")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)

    XCTAssertTrue(lowestCostPathFinder.path.madeToOtherSideOfBoard)
    XCTAssertEqual(lowestCostPathFinder.path.lowestTotalCost, 3)
    XCTAssertEqual(lowestCostPathFinder.path.pathOfLowestCost, [1, 1])
  }
  
  func testFindLowetsPathThatDoesntCrossASingleTile(){
    let expected = Path(madeToOtherSideOfBoard: false, lowestTotalCost: nil, pathOfLowestCost: [Int]())
    board.addRow("50")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)

  }
}