let n = Int(readLine()!)!
var array = [(t: Int, p: Int)]()

for _ in 0..<n {
    let tp = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((tp[0], tp[1]))
}

var dp = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
    let temp = array[i].t + i
    if temp <= n {
        dp[temp] = max(dp[i] + array[i].p, dp[temp])
    }
    dp[i + 1] = max(dp[i + 1], dp[i])
}
print(dp[n])
