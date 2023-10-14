import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    guard (a + b) % 2 == 0 else {return 2 * (a + b)}
    
    if a % 2 == 1 && b % 2 == 1 {
        return (a * a) + (b * b)
    }
    
    return abs(a - b)
}