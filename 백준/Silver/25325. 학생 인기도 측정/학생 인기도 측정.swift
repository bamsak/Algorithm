let n = Int(readLine()!)!
var dict = [String: Int]()
let temp = readLine()!.split(separator: " ").map { String($0) }
temp.forEach { dict[$0] = 0 }
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    input.forEach { dict[$0]! += 1 }
}

dict.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    return $0.value > $1.value
}.forEach {
    print("\($0.key) \($0.value)")
}