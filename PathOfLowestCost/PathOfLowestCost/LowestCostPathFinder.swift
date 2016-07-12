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
    for i in 0...board!.tiles.endIndex - 1{
      if (i == 0){
        lowestTotalCost = 0
        pathOfLowestCost = [Int]()
      }
      lowestTotalCost! += board!.tiles[i].value
      pathOfLowestCost!.append(1)
    }
  }
  
}