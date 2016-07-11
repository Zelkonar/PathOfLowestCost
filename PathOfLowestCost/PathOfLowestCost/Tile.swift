import Foundation

class Tile : Equatable{
  let value: Int
  let column: Int
  
  init(value: Int = 0, column: Int = 0){
    self.value = value
    self.column = column
  }
 
}

func ==(lhs: Tile, rhs: Tile) -> Bool{
  return lhs.value == rhs.value
}