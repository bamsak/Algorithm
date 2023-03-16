import Foundation

func solution(_ n:Int, _ numlist:[Int]) -> [Int] {
    var newList: [Int] = []
    
    for num in numlist {
        if num % n == 0 {
            newList.append(num)
        } 
    }
    return newList
}