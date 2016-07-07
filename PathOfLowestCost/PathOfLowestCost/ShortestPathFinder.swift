import Foundation

class ShortestPathFinder{
  var board = [Int]()

  func addRow(row: String){
    for numberString in row.componentsSeparatedByString(" "){
      board.append(Int(numberString)!)
    }
  }
}