import Foundation

class LowestCostPathFinder{
  var board: Board
  var madeToOtherSideOfBoard = false
  var lowestTotalCost: Int?
  
  init(){
    self.board = Board()
  }
  
  init(board: Board){
    self.board = board
  }
}