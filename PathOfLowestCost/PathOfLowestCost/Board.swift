import Foundation

class Board{
  var tiles = [Int]()
  internal private(set) var rows = 0
  internal private(set) var columns = 0
  
  func addRow(row: String){
    let separatedRow = row.componentsSeparatedByString(" ")
    
    if (columns == 0){
      columns = separatedRow.count
    }
    
    for numberString in separatedRow{
      tiles.append(Int(numberString)!)
    }
    rows += 1
  }
}