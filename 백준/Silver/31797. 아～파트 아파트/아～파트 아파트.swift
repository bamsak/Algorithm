let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var hands = [(f: Int, num: Int)]()

for i in 0..<m {
    let h = readLine()!.split(separator: " ").map { Int($0)! }
    hands.append((h[0], i + 1))
    hands.append((h[1], i + 1))
}

hands.sort { $0.f < $1.f }

print(hands[(n - 1) % (2 * m)].num)