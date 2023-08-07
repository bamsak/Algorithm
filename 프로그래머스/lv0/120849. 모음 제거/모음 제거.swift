import Foundation

func solution(_ my_string:String) -> String {
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    var result: String = ""
    for char in my_string {
        if !vowels.contains(char) {
            result.append(char)
        }
    }
    return result
}