let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var chapters = [(d: Int, p: Int)]()

var dp = Array(repeating: Array(repeating: 0 , count: n + 1), count: m + 1)
for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  chapters.append((input[0], input[1]))
}

for i in 1...m {
  for j in 1...n {
    if chapters[i - 1].d > j {
      dp[i][j] = dp[i - 1][j]
    } else {
      dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - chapters[i - 1].d] + chapters[i - 1].p)
    }
  }
}

print(dp[m][n])