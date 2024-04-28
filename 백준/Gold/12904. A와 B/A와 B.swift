let s = readLine()!
var t = readLine()!.map { String($0) }

while s.count != t.count {
    if t.last! == "A" {
        t.removeLast()
    } else {
        t.removeLast()
        t = t.reversed()
    }
}

print(s == t.joined() ? "1" : "0")