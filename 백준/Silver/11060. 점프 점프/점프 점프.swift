let n = Int(readLine()!)!
let maze = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: 1001, count: n + 1)
dp[1] = 0

for i in 1...n {
    for j in 0..<maze[i - 1] where i + j + 1 <= n {
        dp[i + j + 1] = min(dp[i + j + 1], dp[i] + 1)
    }
}

print(dp[n] == 1001 ? -1 : dp[n])