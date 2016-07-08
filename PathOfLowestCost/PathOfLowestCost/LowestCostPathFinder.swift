import Foundation

class LowestCostPathFinder{
  var board: Board
  var madeToOtherSideOfBoard = false
  var totalCost = 0
  
  init(){
    self.board = Board()
  }
  
  init(board: Board){
    self.board = board
  }
}