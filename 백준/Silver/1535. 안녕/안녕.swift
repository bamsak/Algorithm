let n = Int(readLine()!)!
let l = readLine()!.split(separator: " ").map { Int($0)! }
let h = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Array(repeating: 0, count: 100), count: n + 1)

for i in 1...n {
  for j in 0..<100 {
    if j >= l[i - 1] {
      dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - l[i - 1]] + h[i - 1])
    } else {
      dp[i][j] = dp[i - 1][j]
    }
  }
}


print(dp[n].max()!)