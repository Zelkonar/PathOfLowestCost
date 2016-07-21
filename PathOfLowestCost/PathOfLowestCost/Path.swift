import Foundation

class Path : Equatable{
  var madeToOtherSideOfBoard = false
  var lowestTotalCost: Int?
  var pathOfLowestCost = [Int]()
  
  init(){}
  
  init(_ madeToOtherSideOfBoard: Bool, _ lowestTotalCost: Int?, _ pathOfLowestCost: [Int]){
    self.madeToOtherSideOfBoard = madeToOtherSideOfBoard
    self.lowestTotalCost = lowestTotalCost
    self.pathOfLowestCost = pathOfLowestCost
  }
}

func ==(lhs: Path, rhs: Path) -> Bool{
  return (lhs.madeToOtherSideOfBoard == rhs.madeToOtherSideOfBoard) &&
         (lhs.lowestTotalCost == rhs.lowestTotalCost) &&
         (lhs.pathOfLowestCost == rhs.pathOfLowestCost)
}
