import Foundation

func solution(_ numbers:[Int], _ n:Int) -> Int {
    var result = 0
    var idx = 0
    while result <= n {
        result += numbers[idx]
        idx += 1
    }
    return result
}