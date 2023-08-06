import Foundation

func solution(_ s:String) -> Bool
{
    var pCount: Int = s.lowercased().filter{$0 == "p"}.count
    var yCount: Int = s.lowercased().filter{$0 == "y"}.count

    return pCount == yCount ? true : false
}