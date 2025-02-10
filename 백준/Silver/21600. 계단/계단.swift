let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: 0, count: n)
dp[0] = 1

for i in 1..<n {
    if array[i] >= dp[i - 1] + 1 {
        dp[i] = dp[i - 1] + 1
    } else {
        dp[i] = array[i]
    }
}

print(dp.max()!)
