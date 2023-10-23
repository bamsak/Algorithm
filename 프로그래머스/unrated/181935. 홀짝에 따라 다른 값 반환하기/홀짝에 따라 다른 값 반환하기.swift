import Foundation

func solution(_ n:Int) -> Int {
    let odd = Array(1...n).filter{$0 % 2 != 0}.reduce(0, +)
    let even = Array(1...n).filter{$0 % 2 == 0}.map{$0 * $0}.reduce(0, +)
    return n % 2 != 0 ? odd : even
}