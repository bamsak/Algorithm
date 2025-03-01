let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var desserts = [[Int]]()

for _ in 0..<m {
    desserts.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
var result = 0

for i in 0..<m {
    dp[i][0] = desserts[i][0]
}

for i in 1..<n {
    for j in 0..<m {
        for k in 0..<m {
            let new = j == k ? desserts[j][i] / 2 : desserts[j][i]
            dp[j][i] = max(dp[j][i], dp[k][i - 1] + new)
        }
    }
}

for i in 0..<m {
    result = max(result, dp[i][n - 1])
}
print(result)
