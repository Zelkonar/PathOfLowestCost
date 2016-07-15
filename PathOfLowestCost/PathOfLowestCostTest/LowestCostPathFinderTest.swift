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
  }
  
  func testFindLowetsPathThatDoesntCrossASingleTile(){
    let expected = Path(madeToOtherSideOfBoard: false, lowestTotalCost: nil, pathOfLowestCost: [Int]())
    board.addRow("50")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testFindLowestPathCrosses1TileButDoesNotContinueIfAboveMaxPathValue(){
    let expected = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 5, pathOfLowestCost: [1])
    board.addRow("5 50")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testFindLowestPathListensToRow(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 5, pathOfLowestCost: [2])
    board.addRow("10")
    board.addRow("5")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testFindLowestPathWillCrossDiagnolDown(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 2, pathOfLowestCost: [1, 2])
    board.addRow("1 10")
    board.addRow("10 1")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testPillarVersion(){
    let expected = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 48, pathOfLowestCost: [1, 1, 1])
    board.addRow("19 10 19 10 19")
    board.addRow("21 23 20 19 12")
    board.addRow("20 12 20 11 10")
    
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
}