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
      if(continuationCheck(i) == false){
        return
      }
      lowestTotalCost! += board!.tiles[i].value
      pathOfLowestCost!.append(1)
      if (board!.tiles[i].column == board!.columns){
        madeToOtherSideOfBoard = true
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
        lowestTotalCost = 0
        pathOfLowestCost = [Int]()
      }
    }
    
    return result
  }
  
}