let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
var object = [(w: 0, v: 0)]

for _ in 0..<n {
  let wv = readLine()!.split(separator: " ").map { Int($0)! }
  object.append((wv[0], wv[1])) 
}

for i in 1...n {
  for j in 1...k {
    if object[i].w > j {
      dp[i][j] = dp[i - 1][j]
    } else {
      dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - object[i].w] + object[i].v)
    }
  }
}
print(dp[n][k])