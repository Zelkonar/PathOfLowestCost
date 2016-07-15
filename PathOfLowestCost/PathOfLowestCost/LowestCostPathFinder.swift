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
    for i in 0...board!.tiles.endIndex - 1{
      if(isValidToContinue(i) == false){
        return
      }
      if (i == 0){
        path = Path(madeToOtherSideOfBoard: false, lowestTotalCost: 0, pathOfLowestCost: [Int]())
        addTileToPath(getTile(i))
      }
      else if(getTile(i).row != getTile(i-1).row){
        path.lowestTotalCost! = getTile(i).value
        path.pathOfLowestCost = [getTile(i).row]
      }
      else{
        addTileToPath(getTile(i))
      }
      if (getTile(i).column == board!.columns){
        path.madeToOtherSideOfBoard = true
      }
    }
  }
  
  private func isValidToContinue(index: Int) -> Bool{
    if ((path.lowestTotalCost ?? 0) + getTile(index).value >= maxPathCost){
      return false
    }
    return true
  }
  
  private func getTile(index: Int) -> Tile{
    return board!.tiles[index]
  }
  
  private func addTileToPath(tile: Tile){
    path.lowestTotalCost! += tile.value
    path.pathOfLowestCost.append(tile.row)
  }
}