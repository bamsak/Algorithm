let nt = readLine()!.split(separator: " ").map { Int($0)! }
let (n, t) = (nt[0], nt[1])

var dp = Array(repeating: Array(repeating: 0, count: t + 1), count: n + 1)
var subjects = [(k: Int, s: Int)]()

for _ in 0..<n {
  let ks = readLine()!.split(separator: " ").map { Int($0)! }
  subjects.append((ks[0], ks[1]))
}

for i in 1...n {
  for j in 1...t {
    if subjects[i - 1].k > j {
      dp[i][j] = dp[i - 1][j]
    } else {
      dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - subjects[i - 1].k] + subjects[i - 1].s)
    }
  }
}
print(dp[n][t])