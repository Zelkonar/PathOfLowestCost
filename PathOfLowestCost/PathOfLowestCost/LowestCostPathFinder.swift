import Foundation

class LowestCostPathFinder{
  var board: Board?
  var madeToOtherSideOfBoard = false
  var lowestTotalCost: Int?
  var pathOfLowestCost: [Int]?
  
  init(){}
  
  init(board: Board){
    self.board = board
  }
  
  func findLowestCostPath(){
    madeToOtherSideOfBoard = true
    lowestTotalCost = 1
    pathOfLowestCost = [1]
  }
}