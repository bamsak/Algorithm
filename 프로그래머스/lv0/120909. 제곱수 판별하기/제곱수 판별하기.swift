import Foundation

func solution(_ n:Int) -> Int {
    var result: Int = 2
    for i in 1...n {
        if i * i == n {
            result = 1
        } 
    }
    return result
}