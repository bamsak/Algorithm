func solution(_ phone_number:String) -> String {
    var num = phone_number.map { String($0) }
    for i in 0..<num.count - 4 {
        num[i] = "*"
    }
    return num.joined()
}