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
    if (board == nil){
      return
    }
    var paths = [Path]()
    for i in 1...board!.columns{
      for j in 1...board!.rows{
        paths.append(pathToAdd(j, i, paths))
      }
      let traversalCount = maxTraverseCount(paths)
      paths = paths.filter{$0.pathOfLowestCost.count == traversalCount}
      if (traversalCount < i){
        break
      }
    }
    if (paths.isEmpty){
      return
    }
    path = pathOfLowestCost(paths)
  }
  
  func output() -> String{
    if (board == nil || path.lowestTotalCost == nil){
      return "No Path"
    }
    var result = String()
    result = path.madeToOtherSideOfBoard ? "Yes" : "No"
    result += "\n\(path.lowestTotalCost!)\n"
    for row in path.pathOfLowestCost{
      result += "\(row) "
    }
    result = removeTrailingWhiteSpace(result)
    return result
  }
  
  private func getUniqueTile(row row: Int, column: Int) -> Tile{
    return board!.tiles.filter{$0.row == row && $0.column == column}.first!
  }
  
  private func isValidToContinue(pathValue: Int, _ tileValue: Int) -> Bool{
    return pathValue + tileValue < maxPathCost
  }
  
  private func pathToAdd(row: Int, _ column: Int, _ paths: [Path]) -> Path{
    let tile = getUniqueTile(row: row, column: column)
    let isFinalColumn = board!.columns == column ? true : false
    
    if (column == 1){
      if(isValidToContinue(0, tile.value)){
        return Path(isFinalColumn, tile.value, [row])
      }
    }
    else if(paths.isEmpty == false){
      let newPath = lowestCostPathBeforeTile(paths, tile, column)
      if (isValidToContinue(newPath.lowestTotalCost!, tile.value)){
        return Path(isFinalColumn, newPath.lowestTotalCost! + tile.value, newPath.pathOfLowestCost + [row])
      }
      
    }
    return Path()
  }
  
  private func maxTraverseCount(paths: [Path]) -> Int{
    return paths.maxElement{$0.0.pathOfLowestCost.count <= $0.1.pathOfLowestCost.count}!.pathOfLowestCost.count
  }
  
  private func pathOfLowestCost(paths: [Path]) -> Path{
    return paths.minElement{$0.0.lowestTotalCost < $0.1.lowestTotalCost}!
  }
  
  private func lowestCostPathBeforeTile(paths: [Path], _ tile: Tile, _ column: Int) -> Path{
    let rowPlusOne = tile.row + 1 > board?.rows ? 1 : tile.row + 1
    let rowMinusOne = tile.row - 1 < 1 ? board!.rows : tile.row - 1
    let rowsToAdd = [tile.row, rowPlusOne, rowMinusOne]
    let possiblePaths = paths.filter{$0.pathOfLowestCost.count == column - 1 && rowsToAdd.contains($0.pathOfLowestCost.last!)}
    return pathOfLowestCost(possiblePaths)
  }
  
  private func removeTrailingWhiteSpace(s: String) -> String{
    return String(s.characters.dropLast())
  }
}