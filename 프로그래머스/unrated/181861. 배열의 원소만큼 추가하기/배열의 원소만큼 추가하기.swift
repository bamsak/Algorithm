import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var result: [Int] = []
    for i in arr {
        for j in 1...i {
            result.append(i)
        }
    }
    return result
}