let n = Int(readLine()!)!
var dp = [(count: Int, prev: Int)](repeating: (0, 0), count: n + 1)

for i in 1...n {
  dp[i] = (dp[i - 1].count + 1, i - 1)
  
  if i % 3 == 0 && dp[i / 3].count + 1 < dp[i].count {
    dp[i] = (dp[i / 3].count + 1, i / 3)
  }
  
  if i % 2 == 0 && dp[i / 2].count + 1 < dp[i].count {
    dp[i] = (dp[i / 2].count + 1, i / 2)
  }
}


var idx = n
var result = ""

while idx > 0 {
  result += "\(idx) "
  idx = dp[idx].prev
}

print("\(dp[n].count - 1)\n\(result)")