func solution(_ n:Int) -> String {
    var result = Array(repeating: "수", count: n)
    for i in 0..<result.count where i % 2 != 0 {
        result[i] = "박"
    }
    return result.joined()
}
