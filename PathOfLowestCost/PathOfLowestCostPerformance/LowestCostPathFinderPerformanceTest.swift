import XCTest

class LowestCostPathFinderPerformanceTest: XCTestCase {
  
  func testMediumBoard() {
    let lowestCostPathFinder = LowestCostPathFinder()
    let board = Board()
    var rowString = String()
    for column in 1...50{
      rowString += column % 2 == 0 ? "10 " : "-10 "
    }
    rowString = String(rowString.characters.dropLast())
    for _ in 1...5{
      board.addRow(rowString)
    }
    lowestCostPathFinder.board = board
    self.measureBlock {
      lowestCostPathFinder.findLowestCostPath()
    }
  }
  
  func testHugeBoard() {
    let lowestCostPathFinder = LowestCostPathFinder()
    let board = Board()
    var rowString = String()
    for column in 1...100{
      rowString += column % 2 == 0 ? "10 " : "-10 "
    }
    rowString = String(rowString.characters.dropLast())
    for _ in 1...10{
      board.addRow(rowString)
    }
    lowestCostPathFinder.board = board
    self.measureBlock {
      lowestCostPathFinder.findLowestCostPath()
    }
  }
  
}
