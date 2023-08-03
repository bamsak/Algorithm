import Foundation

func solution(_ n:Int, _ k:Int) -> [Int] {
    return Array(1...n).filter{$0 % k == 0}
}