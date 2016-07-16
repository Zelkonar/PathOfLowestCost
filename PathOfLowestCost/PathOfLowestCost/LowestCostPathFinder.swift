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
    var paths = [Path]()
    for i in 1...board!.columns{
      for j in 1...board!.rows{
        let tile = getUniqueTile(row: j, column: i)
        if (i == 1){
          if (isValidToContinue(0, tileValue: tile.value)){
            break;
          }
          paths.append(Path(madeToOtherSideOfBoard: (board!.columns == i ? true : false), lowestTotalCost: tile.value, pathOfLowestCost: [j]))
        }
        else{
          let rowPlusOne = tile.row + 1 > board?.rows ? 1 : tile.row + 1
          let rowMinusOne = tile.row - 1 < 1 ? board!.rows : tile.row - 1
          let rowsToAdd = [tile.row, rowPlusOne, rowMinusOne]
          for path in paths.filter({$0.pathOfLowestCost.count == i - 1 && rowsToAdd.contains($0.pathOfLowestCost.last!)})
          {
            if (isValidToContinue(path.lowestTotalCost!, tileValue: tile.value)){
              break;
            }
            paths.append(Path(madeToOtherSideOfBoard: (board!.columns == i ? true : false), lowestTotalCost: path.lowestTotalCost! + tile.value, pathOfLowestCost: path.pathOfLowestCost + [j]))
          }
        }
      }
    }
    if (paths.isEmpty){
      return
    }
    let maxTraverseCount = paths.maxElement({$0.0.pathOfLowestCost.count <= $0.1.pathOfLowestCost.count})!.pathOfLowestCost.count
    paths = paths.filter({$0.pathOfLowestCost.count == maxTraverseCount})
    path = paths.minElement({$0.0.lowestTotalCost < $0.1.lowestTotalCost})!
  }
  
  func output() -> String{
    if (board == nil || path.lowestTotalCost == nil){
      return "No Path"
    }
    var result = String()
    if (path.madeToOtherSideOfBoard){
      result += "Yes"
    }
    else{
      result += "No"
    }
    result += "\n\(path.lowestTotalCost!)\n"
    for row in path.pathOfLowestCost{
      result += "\(row) "
    }
    result = String(result.characters.dropLast())
    return result
  }
  
  private func getUniqueTile(row row: Int, column: Int) -> Tile{
    return board!.tiles.filter({$0.row == row && $0.column == column}).first!
  }
  
  private func isValidToContinue(pathValue: Int, tileValue: Int) -> Bool{
    return pathValue + tileValue >= maxPathCost
  }
}