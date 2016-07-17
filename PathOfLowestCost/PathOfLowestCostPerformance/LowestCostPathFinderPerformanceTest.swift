import XCTest

class LowestCostPathFinderPerformanceTest: XCTestCase {
  var lowestCostPathFinder = LowestCostPathFinder()
  var board = Board()

  func testSmallBoard(){
    createBoard(3, 7, 10)
    lowestCostPathFinder.board = board
    self.measureBlock{
      self.lowestCostPathFinder.findLowestCostPath()
    }
  }
  
  func testMediumBoard() {
    createBoard(5, 50, 10)
    lowestCostPathFinder.board = board
    self.measureBlock {
      self.lowestCostPathFinder.findLowestCostPath()
    }
  }
  
  func testHugeBoard() {
    createBoard(10, 100, 10)
    lowestCostPathFinder.board = board
    self.measureBlock {
      self.lowestCostPathFinder.findLowestCostPath()
    }
  }
  
  private func createBoard(rows: Int, _ columns: Int, _ num: Int){
    var rowString = String()
    for column in 1...columns{
      rowString += column % 2 == 0 ? "\(num) " : "-\(num) "
    }
    rowString = String(rowString.characters.dropLast())
    for _ in 1...rows{
      board.addRow(rowString)
    }
  }
}
