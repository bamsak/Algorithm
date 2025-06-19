let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var dp = [Int](repeating: 10_001, count: k + 1)
var coins = [Int]()

dp[0] = 0
for _ in 0..<n {
  coins.append(Int(readLine()!)!)
}

for coin in coins {
  if coin > k { continue }
  for i in coin...k {
    dp[i] = min(dp[i], dp[i - coin] + 1)
  }
}

print(dp[k] == 10_001 ? -1 : dp[k])