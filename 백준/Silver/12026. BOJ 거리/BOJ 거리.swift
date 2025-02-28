let n = Int(readLine()!)!
let arr = readLine()!.map { $0 }
var dp = [Int](repeating: Int.max, count: n)
dp[0] = 0

for i in 1..<n {
    for j in 0..<i where dp[j] != Int.max {
        let k = i - j
        if arr[i] == "O" && arr[j] == "B" {
            dp[i] = min(dp[i], dp[j] + k * k)
        } else if arr[i] == "J" && arr[j] == "O" {
            dp[i] = min(dp[i], dp[j] + k * k)
        } else if arr[i] == "B" && arr[j] == "J" {
            dp[i] = min(dp[i], dp[j] + k * k)
        }
    }
}
print(dp[n - 1] == Int.max ? -1 : dp[n - 1])
