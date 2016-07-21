import Foundation

class Board : Equatable{
  private(set) var grid = [[Int]]()
  private(set) var rows = 0
  private(set) var columns = 0
  
  func addRow(row: String){
    rows += 1
    let separatedRow = row.componentsSeparatedByString(" ")
    
    if (columns == 0){
      columns = separatedRow.count
    }
    
    var numRow = [Int]()
    for numberString in separatedRow{
      numRow.append(Int(numberString)!)
    }
    
    grid.append(numRow)
  }
}

func ==(lhs: Board, rhs: Board) -> Bool{
  return (lhs.grid == rhs.grid) &&
         (lhs.rows == rhs.rows) &&
         (lhs.columns == rhs.columns)
}