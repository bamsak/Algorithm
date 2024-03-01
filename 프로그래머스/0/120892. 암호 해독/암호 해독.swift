import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    let arr = cipher.map { String($0) }
    var current = code - 1
    var result = ""
    
    while current < arr.count {
        result += arr[current]
        current += code
    }

    return result
}
