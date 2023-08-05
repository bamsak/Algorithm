import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let aPlusb: Int = Int (String(a) + String(b)) ?? 0
    let bPlusa: Int = Int (String(b) + String(a)) ?? 0
    
    return aPlusb > bPlusa ? aPlusb : bPlusa
}