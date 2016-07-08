import Foundation

class LowestCostPathFinder{
  var board: Board?
  var madeToOtherSideOfBoard = false
  var lowestTotalCost: Int?
  
  init(){}
  
  init(board: Board){
    self.board = board
  }
}