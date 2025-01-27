let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
dp[1][1] = 1

for y in 1...m {
    for x in 1...n {
        dp[y][x] = (dp[y][x] + dp[y - 1][x] + dp[y][x - 1] + dp[y - 1][x - 1]) % 1_000_000_007
    }
}

print(dp[m][n])
