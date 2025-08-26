var dp = Array(repeating: 0, count: 47)
dp[1] = 1
dp[2] = 1

for i in 3..<47 {
  dp[i] = dp[i - 1] + dp[i - 2]
}

for _ in 0..<Int(readLine()!)! {
  var num = Int(readLine()!)!
  var temp = [Int]()
  var start = 0
  
  for i in 0..<dp.count {
    if dp[i] > num {
      break
    }
    start = i
  }
  
  num -= dp[start]
  temp.append(dp[start])
  
  for i in (1..<start).reversed() {
    if num - dp[i] >= 0 {
      num -= dp[i]
      temp.append(dp[i])
    }
  }
  
  print(temp.reversed().map { String($0) }.joined(separator: " "))
}