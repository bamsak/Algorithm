let f = readLine()!.split(separator: " ")
let m = readLine()!.split(separator: " ")
var child = [(b: String, t: String)]()
let s = Set(f + m).map { String($0) }.sorted()

for i in 0..<s.count {
    for j in 0..<s.count {
        child.append((s[i], s[j]))
    }
}

var result = ""

child.forEach { b, t in
    result += "\(b) \(t)\n"
}

print(result)