let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: 1, count: n)

for i in (0..<n - 1).reversed() {
    if nums[i] + i + 1 >= n {
        continue
    }
    
    if nums[i] == 0 {
        dp[i] = dp[i + 1] + 1
        continue
    }
    
    dp[i] = dp[i + nums[i] + 1] + 1
}

print(dp.map { String($0) }.joined(separator: " "))
