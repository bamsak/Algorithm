let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var dp: [Int] = Array(repeating: 1, count: n + 1)

for i in 1...n {
    for j in 1..<i {
        if nums[j - 1] < nums[i - 1] {
            dp[i] = (dp[i] + dp[j]) % 998_244_353
        }
    }
}

print(dp[1...n].map { String($0) }.joined(separator: " "))
