import Foundation

class Board : Equatable{
  private(set) var tiles = [Tile]()
  private(set) var rows = 0
  private(set) var columns = 0
  
  func addRow(row: String){
    rows += 1
    let separatedRow = row.componentsSeparatedByString(" ")
    
    if (columns == 0){
      columns = separatedRow.count
    }
    
    var column = 0
    for numberString in separatedRow{
      column += 1
      tiles.append(GetTileFromNumberString(numberString, column: column, row: rows))
    }
  }
  
  func GetTileFromNumberString(number: String, column: Int, row: Int) -> Tile{
    return Tile(value: Int(number)!, column: column, row: row)
  }
}

func ==(lhs: Board, rhs: Board) -> Bool{
  return (lhs.tiles == rhs.tiles) &&
         (lhs.rows == rhs.rows) &&
         (lhs.columns == rhs.columns)
}