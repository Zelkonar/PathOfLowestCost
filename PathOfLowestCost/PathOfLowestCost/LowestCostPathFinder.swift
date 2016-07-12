import Foundation

class LowestCostPathFinder{
  var board: Board?
  private(set) var path = Path()
  
  init(){}
  
  init(board: Board){
    self.board = board
  }
  
  func findLowestCostPath(){
    path.madeToOtherSideOfBoard = false
    for i in 0...board!.tiles.endIndex - 1{
      if(continuationCheck(i) == false){
        return
      }
      path.lowestTotalCost! += board!.tiles[i].value
      path.pathOfLowestCost.append(1)
      if (board!.tiles[i].column == board!.columns){
        path.madeToOtherSideOfBoard = true
      }
    }
  }
  
  private func continuationCheck(index: Int) -> Bool{
    var result = true
    
    if (index == 0){
      if (board!.tiles[index].value >= 50){
        result = false
      }
      else {
        path.lowestTotalCost = 0
        path.pathOfLowestCost = [Int]()
      }
    }
    
    return result
  }
  
}