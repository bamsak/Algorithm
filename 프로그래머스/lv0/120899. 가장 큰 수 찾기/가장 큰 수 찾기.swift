import Foundation

func solution(_ array:[Int]) -> [Int] {
    var result: [Int] = []
    guard let number = array.sorted().last else {return []}
    guard let index: Int = array.firstIndex(where: {$0 == number}) else {return []}
    result.append(number)
    result.append(index)
    
    return result

}