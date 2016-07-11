import Foundation

class Tile : Equatable{
  let value: Int
  let column: Int
  
  init(value: Int, column: Int){
    self.value = value
    self.column = column
  }
 
}

func ==(lhs: Tile, rhs: Tile) -> Bool{
  return (lhs.value == rhs.value) &&
         (lhs.column == rhs.column)
}