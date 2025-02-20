let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map = Array(repeating: Array(repeating: 0, count: 301), count: 301)

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (xy[0], xy[1])
    
    map[y][x] = max(m - (x + y), 0)
}

var dp = Array(repeating: Array(repeating: 0, count: 302), count: 302)

for y in 1...301 {
    for x in 1...301 {
        dp[y][x] = max(dp[y - 1][x], dp[y][x - 1]) + map[y - 1][x - 1]
    }
}

print(dp[301][301])
