let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    let sec = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = sec[2] 
}

var dp = [Int](repeating: 0, count: n + 1)

if n >= 1 { 
  dp[1] = arr[1]
}

if n >= 2 {
    for i in 2...n {
        dp[i] = max(dp[i - 1], dp[i - 2] + arr[i])
    }
}

print(dp[n])
