let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for y in 1...n {
    for x in 1...m {
        dp[y][x] = max(dp[y][x - 1], dp[y - 1][x - 1], dp[y - 1][x]) + map[y - 1][x - 1]
    }
}

print(dp[n][m])
