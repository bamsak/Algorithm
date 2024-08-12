let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var cinema = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    cinema[i] = readLine()!.map { Int(String($0))!}
}

var result = 0

for y in 0..<n {
    var current = 0
    for x in 0..<m {
        if cinema[y][x] == 0 {
            current += 1
        } else {
            current = 0
            continue
        }
        
        if current >= k {
            result += 1
        }
    }
}

print(result)