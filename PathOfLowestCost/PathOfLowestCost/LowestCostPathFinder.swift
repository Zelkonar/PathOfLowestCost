import Foundation

class LowestCostPathFinder{
  var board: Board
  var madeToOtherSideOfBoard = false
  
  init(){
    self.board = Board()
  }
  
  init(board: Board){
    self.board = board
  }
}