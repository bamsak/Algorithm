import Foundation

func solution(_ rsp:String) -> String {
    let result = rsp.map{
        switch $0 {
            case "2": return "0"
            case "0": return "5"
            case "5": return "2"
            default: return ""
        }
    }.joined()
    return result
}
