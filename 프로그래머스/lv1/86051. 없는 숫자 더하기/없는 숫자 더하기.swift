import Foundation

func solution(_ numbers:[Int]) -> Int {
    return (0...9).map{!numbers.contains($0) ? $0 : 0}.reduce(0, +)
}
