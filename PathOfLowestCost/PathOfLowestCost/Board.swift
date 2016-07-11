import Foundation

class Board : Equatable{
  var tiles = [Tile]()
  private(set) var rows = 0
  private(set) var columns = 0
  
  func addRow(row: String){
    let separatedRow = row.componentsSeparatedByString(" ")
    
    if (columns == 0){
      columns = separatedRow.count
    }
    
    for numberString in separatedRow{
      tiles.append(GetTileFromNumberString(numberString))
    }
    rows += 1
  }
  
  func GetTileFromNumberString(number: String) -> Tile{
    return Tile(value: Int(number)!, column: 0)
  }
}

func ==(lhs: Board, rhs: Board) -> Bool{
  return (lhs.tiles == rhs.tiles) &&
         (lhs.rows == rhs.rows) &&
         (lhs.columns == rhs.columns)
}