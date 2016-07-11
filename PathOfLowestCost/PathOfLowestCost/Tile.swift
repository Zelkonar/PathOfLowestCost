import Foundation

class Tile : Equatable{
  let value: Int
  
  init(){
    self.value = 0
  }
  
  init(value: Int){
    self.value = value
  }
 
}

func ==(lhs: Tile, rhs: Tile) -> Bool{
  return lhs.value == rhs.value
}