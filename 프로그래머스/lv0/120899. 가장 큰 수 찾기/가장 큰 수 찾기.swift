import Foundation

func solution(_ array:[Int]) -> [Int] {
    guard let number = array.sorted().last else {return []}
    guard let index: Int = array.firstIndex(of: number) else {return []}
    
    return [number, index]

}