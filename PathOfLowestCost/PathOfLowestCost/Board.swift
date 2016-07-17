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
      tiles.append(GetTileFromNumberString(numberString, column, rows))
    }
  }
  
  func GetTileFromNumberString(number: String, _ column: Int, _ row: Int) -> Tile{
    return Tile(Int(number)!, column, row)
  }
}

func ==(lhs: Board, rhs: Board) -> Bool{
  return (lhs.tiles == rhs.tiles) &&
         (lhs.rows == rhs.rows) &&
         (lhs.columns == rhs.columns)
}