var S = readLine()!.map { String($0) }

var zero = 0
var one = 0

for s in S {
    if s == "0" {
        zero += 1
        continue
    }
    one += 1
}

zero /= 2
one /= 2

for _ in 0..<zero {
    guard let i = S.lastIndex(of: "0") else { continue }
    S.remove(at: i)
}

for _ in 0..<one {
    guard let i = S.firstIndex(of: "1") else { continue }
    S.remove(at: i)
}

print(S.joined())