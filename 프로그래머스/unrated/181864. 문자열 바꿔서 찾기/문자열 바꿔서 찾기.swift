import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    return myString.map{String($0) == "A" ? "B" : "A"}.joined().contains(pat) ? 1 : 0
}