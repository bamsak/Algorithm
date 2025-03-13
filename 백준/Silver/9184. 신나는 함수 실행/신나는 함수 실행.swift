var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 21), count: 21), count: 21)

for i in 0...20 {
  for j in 0...20 {
    for k in 0...20 {
      if i == 0 || j == 0 || k == 0 {
        dp[i][j][k] = 1
      } else if i < j && j < k {
        dp[i][j][k] = dp[i][j][k - 1] + dp[i][j - 1][k - 1] - dp[i][j - 1][k]
      } else {
          dp[i][j][k] = dp[i - 1][j][k] + dp[i - 1][j - 1][k] + dp[i - 1][j][k - 1] - dp[i - 1][j - 1][k - 1]
      }
    }
  }
}

while let input = readLine(), input != "-1 -1 -1" {
  let abc = input.split(separator: " ").map { Int($0)! }
  let (a, b, c) = (abc[0], abc[1], abc[2])
  
  var result = "w(\(a), \(b), \(c)) = "
  if a < 1 || b < 1 || c < 1 {
    result += "1"
    print(result)
    continue
  }
  
  if a > 20 || b > 20 || c > 20 {
    result += "\(dp[20][20][20])"
    print(result)
    continue
  }
  
  result += "\(dp[a][b][c])"
  print(result)
}