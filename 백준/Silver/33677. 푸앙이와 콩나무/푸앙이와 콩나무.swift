let n = Int(readLine()!)!

var dp = Array(repeating: (day: Int.max, water: Int.max), count: 1_000_001)

dp[0] = (day: 0, water: 0)

for i in 0..<1_000_001 {
    if dp[i].day == Int.max { continue }
    
    let day = dp[i].day + 1
    let water1 = dp[i].water + 1
    let water3 = dp[i].water + 3
    let water5 = dp[i].water + 5
    
    if i + 1 < 1_000_001 && (day < dp[i + 1].day || (day == dp[i + 1].day && water1 < dp[i + 1].water)) {
        dp[i + 1] = (day: day, water: water1)
    }
    
    if i * 3 < 1_000_001 && (day < dp[i * 3].day || (day == dp[i * 3].day && water3 < dp[i * 3].water)) {
        dp[i * 3] = (day: day, water: water3)
    }
    

    if i * i < 1_000_001 && (day < dp[i * i].day || (day == dp[i * i].day && water5 < dp[i * i].water)) {
        dp[i * i] = (day: day, water: water5)
    }
}

print("\(dp[n].day) \(dp[n].water)")