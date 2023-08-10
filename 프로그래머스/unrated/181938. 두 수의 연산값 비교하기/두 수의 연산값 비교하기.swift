import Foundation

func solution(_ a:Int, _ b:Int) -> Int {

    return Int(String(a) + String(b)) ?? 0 > 2 * a * b ? Int(String(a) + String(b)) ?? 0 : 2 * a * b
}