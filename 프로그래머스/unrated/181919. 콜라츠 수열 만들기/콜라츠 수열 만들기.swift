import Foundation

func solution(_ n:Int) -> [Int] {
    var result: [Int] = []
    var num: Int = n
    
    while num != 1 {
        result.append(num)
        if num % 2 == 0 {
            num = num / 2
        } else {
            num = 3 * num + 1
        }
    }
    result.append(1)
    return result
}