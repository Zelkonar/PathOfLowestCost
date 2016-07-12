import Foundation

class LowestCostPathFinder{
  var board: Board?
  private(set) var madeToOtherSideOfBoard = false
  private(set) var lowestTotalCost: Int?
  private(set) var pathOfLowestCost: [Int]?
  
  init(){}
  
  init(board: Board){
    self.board = board
  }
  
  func findLowestCostPath(){
    madeToOtherSideOfBoard = false
    for i in 0...board!.tiles.endIndex - 1{
      if (i == 0){
        if (board!.tiles[i].value >= 50){
          return
        }
        lowestTotalCost = 0
        pathOfLowestCost = [Int]()
      }
      lowestTotalCost! += board!.tiles[i].value
      pathOfLowestCost!.append(1)
      if (board!.tiles[i].column == board!.columns){
        madeToOtherSideOfBoard = true
      }
    }
  }
  
}