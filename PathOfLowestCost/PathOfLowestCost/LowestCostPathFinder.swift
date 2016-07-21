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
    for column in 1...board!.columns{
      for row in 1...board!.rows{
        paths.append(pathToAdd(row, column, paths))
      }
      let traversalCount = maxTraverseCount(paths)
      paths = paths.filter{$0.pathOfLowestCost.count == traversalCount}
      if (traversalCount < column){
        break
      }
    }
    if (paths.isEmpty){
      return
    }
    path = pathOfLowestCost(paths)
  }
  
  func output() -> String{
    if (path.lowestTotalCost == nil){
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
  
  private func isValidToContinue(pathValue: Int, _ tileValue: Int) -> Bool{
    return pathValue + tileValue < maxPathCost
  }
  
  private func pathToAdd(row: Int, _ column: Int, _ paths: [Path]) -> Path{
    let tile = board!.grid[row - 1][column - 1]
    let isFinalColumn = board!.columns == column ? true : false
    
    if (column == 1){
      if(isValidToContinue(0, tile)){
        return Path(isFinalColumn, tile, [row])
      }
    }
    else if(paths.isEmpty == false){
      let newPath = lowestCostPathBeforeTile(paths, tile, row, column)
      if (isValidToContinue(newPath.lowestTotalCost!, tile)){
        return Path(isFinalColumn, newPath.lowestTotalCost! + tile, newPath.pathOfLowestCost + [row])
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
  
  private func lowestCostPathBeforeTile(paths: [Path], _ tile: Int, _ row: Int, _ column: Int) -> Path{
    let rowPlusOne = row + 1 > board?.rows ? 1 : row + 1
    let rowMinusOne = row - 1 < 1 ? board!.rows : row - 1
    let rowsToAdd = [row, rowPlusOne, rowMinusOne]
    let possiblePaths = paths.filter{$0.pathOfLowestCost.count == column - 1 && rowsToAdd.contains($0.pathOfLowestCost.last!)}
    return pathOfLowestCost(possiblePaths)
  }
  
  private func removeTrailingWhiteSpace(s: String) -> String{
    return String(s.characters.dropLast())
  }
}