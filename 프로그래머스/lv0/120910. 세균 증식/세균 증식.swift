import Foundation

func solution(_ n:Int, _ t:Int) -> Int {
    var result = n
    for i in 0..<t {
        result *= 2
    }
    return result
}