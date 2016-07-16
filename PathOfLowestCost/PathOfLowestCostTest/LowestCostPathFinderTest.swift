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
  
  func testFindLowestPathWithMoreThan2Columns(){
    let expected = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 48, pathOfLowestCost: [1, 1, 1])
    board.addRow("19 10 19 10 19")
    board.addRow("21 23 20 19 12")
    board.addRow("20 12 20 11 10")
    
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testPathTraverseWontJumpMoreThanOneDiagonally(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 3, pathOfLowestCost: [2, 1])
    board.addRow("10 1")
    board.addRow("2 10")
    board.addRow("1 10")
    board.addRow("10 10")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testFindLowestPathJumpsToOtherSideOfBoard(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 2, pathOfLowestCost: [3, 1])
    board.addRow("10 1")
    board.addRow("10 10")
    board.addRow("1 10")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testPillarVersion1(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 16, pathOfLowestCost: [1, 2, 3, 4, 4, 5])
    board.addRow("3 4 1 2 8 6")
    board.addRow("6 1 8 2 7 4")
    board.addRow("5 9 3 9 9 5")
    board.addRow("8 4 1 3 2 6")
    board.addRow("3 7 2 8 6 4")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testPillarVersion2(){
    let expected = Path(madeToOtherSideOfBoard: true, lowestTotalCost: 11, pathOfLowestCost: [1, 2, 1, 5, 4, 5])
    board.addRow("3 4 1 2 8 6")
    board.addRow("6 1 8 2 7 4")
    board.addRow("5 9 3 9 9 5")
    board.addRow("8 4 1 3 2 6")
    board.addRow("3 7 2 1 2 3")
    lowestCostPathFinder.board = board
    
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.path, expected)
  }
  
  func testOuputWithValues(){
    let expected = "Yes\n11\n1 2 1 5 4 5"
    board.addRow("3 4 1 2 8 6")
    board.addRow("6 1 8 2 7 4")
    board.addRow("5 9 3 9 9 5")
    board.addRow("8 4 1 3 2 6")
    board.addRow("3 7 2 1 2 3")
    lowestCostPathFinder.board = board
    lowestCostPathFinder.findLowestCostPath()
    
    XCTAssertEqual(lowestCostPathFinder.output(), expected)
  }
}