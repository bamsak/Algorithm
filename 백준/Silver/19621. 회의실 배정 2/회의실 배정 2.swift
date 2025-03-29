let n = Int(readLine()!)!
var meetings = [(s: Int, e: Int, count: Int)]()

for _ in 0..<n {
    let sec = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((sec[0], sec[1], sec[2]))
}

meetings.sort { $0.s < $1.s }

var dp = [Int](repeating: 0, count: 25)
dp[0] = meetings[0].count
dp[1] = n > 1 ? max(dp[0], meetings[1].count) : dp[0]

if n > 2 {
    for i in 2..<n {
        dp[i] = max(dp[i - 1], dp[i - 2] + meetings[i].count )
    }
}

print(dp[n - 1])
