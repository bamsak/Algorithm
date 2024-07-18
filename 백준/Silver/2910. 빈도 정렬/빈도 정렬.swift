let nc = readLine()!.split(separator: " ").map { Int($0)! }
let messages = readLine()!.split(separator: " ").map { Int($0)! }
var dict = [Int: Int]()

for message in messages {
    if dict[message] != nil {
        dict[message]! += 1
    } else {
        dict[message] = 1
    }
}

dict.sorted {
    if $0.value == $1.value {
        return messages.firstIndex(of: $0.key)! < messages.firstIndex(of: $1.key)!
    }
    return $0.value > $1.value
}.forEach {
    for _ in 0..<$0.value {
        print($0.key, terminator: " ")
    }
}