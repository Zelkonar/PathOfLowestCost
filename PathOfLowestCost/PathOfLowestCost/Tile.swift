import Foundation

class Tile : Equatable{
  let value: Int
  let column: Int
  let row: Int
  
  init(value: Int, column: Int, row: Int){
    self.value = value
    self.column = column
    self.row = row
  }
 
}

func ==(lhs: Tile, rhs: Tile) -> Bool{
  return (lhs.value == rhs.value) &&
         (lhs.column == rhs.column) &&
         (lhs.row == rhs.row)
}