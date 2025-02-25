let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: Int.max, count: m), count: n)
dp[0][0] = 0
for y in 0..<n {
    for x in 0..<m {
        let current = map[y][x]
        
        for i in 1...current {
            let newY = y + i
            if newY >= n { break }
            dp[newY][x] = min(dp[newY][x], dp[y][x] + 1)
        }
        
        for j in 1...current {
            let newX = x + j
            if newX >= m { break }
            dp[y][newX] = min(dp[y][newX], dp[y][x] + 1)
        }
    }
}

print(dp[n - 1][m - 1])
