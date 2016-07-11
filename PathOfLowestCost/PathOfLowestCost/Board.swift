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
    
    var column = 0
    for numberString in separatedRow{
      column += 1
      tiles.append(GetTileFromNumberString(numberString, column: column))
    }
    rows += 1
  }
  
  func GetTileFromNumberString(number: String, column: Int) -> Tile{
    return Tile(value: Int(number)!, column: column)
  }
}

func ==(lhs: Board, rhs: Board) -> Bool{
  return (lhs.tiles == rhs.tiles) &&
         (lhs.rows == rhs.rows) &&
         (lhs.columns == rhs.columns)
}