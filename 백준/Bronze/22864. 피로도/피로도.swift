let abcm = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c, m) = (abcm[0], abcm[1], abcm[2], abcm[3])

var temp = 0
var result = 0

for _ in 0..<24 {
    if temp + a <= m {
        temp += a
        result += b
    } else {
        temp = max(0, temp - c)
    }
}

print(result)
