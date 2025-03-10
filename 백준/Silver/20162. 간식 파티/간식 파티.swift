let n = Int(readLine()!)!
var snacks = [Int]()

for _ in 0..<n {
    snacks.append(Int(readLine()!)!)
}

var dp = snacks
var result = -1

for i in 0..<n {
    for j in 0..<i where snacks[i] > snacks[j] {
        dp[i] = max(dp[i], dp[j] + snacks[i])
        result = max(dp[i], result)
    }
}

print(result)
