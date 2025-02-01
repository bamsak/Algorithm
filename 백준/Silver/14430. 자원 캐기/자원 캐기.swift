let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
dp[0][0] = map[0][0]
let dx = [0, 1]
let dy = [1, 0]

for y in 0..<n {
    for x in 0..<m {
        for i in 0..<dx.count {
            let (newX, newY) = (x + dx[i], y + dy[i])
            if newX >= m || newY >= n { continue }
            dp[newY][newX] = max(dp[y][x] + map[newY][newX], dp[newY][newX])
        }
    }
}

print(dp[n - 1][m - 1])
