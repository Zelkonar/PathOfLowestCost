import Foundation

class Board{
  var tiles = [Int]()
  private(set) var rows = 0
  private(set) var columns = 0
  
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