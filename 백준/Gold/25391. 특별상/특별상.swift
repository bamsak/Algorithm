let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var scores = [(a: Int, b: Int)]()
for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    scores.append((a, b))
}
scores.sort {
    if $0.b == $1.b {
        return $0.a > $1.a
    }
    return $0.b < $1.b
}

var result = 0

for _ in 0..<k {
    result += scores.removeLast().a
}

scores.sort { $0.a < $1.a }

for _ in 0..<m {
    result += scores.removeLast().a
}
print(result)