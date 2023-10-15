import Foundation

func solution(_ rsp:String) -> String {
    let arr = rsp.map{String($0)}
    let result = arr.map{
        switch $0 {
            case "2": return "0"
            case "0": return "5"
            case "5": return "2"
            default: return ""
        }
    }.joined()
    return result
}