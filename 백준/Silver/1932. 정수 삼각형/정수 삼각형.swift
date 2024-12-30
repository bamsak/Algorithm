let n = Int(readLine()!)!
var triangle = [[Int]]()
var dp = [[Int]](repeating: [], count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    triangle.append(input)
    for _ in 0..<input.count {
        dp[i].append(0)
    }
}

dp[0][0] = triangle[0][0]

for y in 1..<n {
    for x in 0...y {
        if x == 0 {
            dp[y][x] = dp[y - 1][x] + triangle[y][x]
        } else if x == y {
            dp[y][x] = dp[y - 1][x - 1] + triangle[y][x]
        } else {
            dp[y][x] = max(dp[y - 1][x], dp[y - 1][x - 1]) + triangle[y][x]
        }
    }
}

print(dp[n - 1].max()!)
