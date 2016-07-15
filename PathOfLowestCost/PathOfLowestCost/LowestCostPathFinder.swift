import Foundation

class LowestCostPathFinder{
  var board: Board?
  private(set) var path = Path()
  var maxPathCost = 50
  
  init(){}
  
  init(board: Board, maxPathCost: Int = 50){
    self.board = board
    self.maxPathCost = maxPathCost
  }
  
  func findLowestCostPath(){
    path.madeToOtherSideOfBoard = false
    for i in 0...board!.tiles.endIndex - 1{
      if(continuationCheck(i) == false){
        return
      }
      if (i == 0){
        path = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 0, pathOfLowestCost: [Int]())
      }
      path.lowestTotalCost! += board!.tiles[i].value
      path.pathOfLowestCost.append(1)
      if (board!.tiles[i].column == board!.columns){
        path.madeToOtherSideOfBoard = true
      }
    }
  }
  
  private func continuationCheck(index: Int) -> Bool{
    if ((path.lowestTotalCost ?? 0) + board!.tiles[index].value >= maxPathCost){
      return false
    }
    return true
  }
}