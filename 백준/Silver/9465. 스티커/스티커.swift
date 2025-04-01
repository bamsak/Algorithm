
for _ in 0..<Int(readLine()!)! {
  let n = Int(readLine()!)!
  var sticker = [[Int]]()
  
  for _ in 0..<2 {
    sticker.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  var dp = Array(repeating: Array(repeating: 0, count: 100_000), count: 2)
  
  for i in 0..<n {
    if i == 0 {
      dp[0][0] = sticker[0][0]
      dp[1][0] = sticker[1][0]
    } else if i == 1 {
      dp[0][i] = dp[1][i - 1] + sticker[0][i]
      dp[1][i] = dp[0][i - 1] + sticker[1][i]
    } else {
      dp[0][i] = max(dp[1][i - 1] + sticker[0][i], dp[1][i - 2] + sticker[0][i])
      dp[1][i] = max(dp[0][i - 1] + sticker[1][i], dp[0][i - 2] + sticker[1][i])
    }
  }
  
  print(max(dp[0][n - 1], dp[1][n - 1]))
}