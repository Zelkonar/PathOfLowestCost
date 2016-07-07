import Foundation

class ShortestPathFinder{
  var board = [Int]()
  var rows = 0
  var columns = 0
  
  func addRow(row: String){
    for numberString in row.componentsSeparatedByString(" "){
      board.append(Int(numberString)!)
    }
    rows += 1
  }
}