let n = Int(readLine()!)!
var arr = [(r: Int, g: Int, b: Int)]()

for _ in 0..<n {
    let rgb = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, g, b) = (rgb[0], rgb[1], rgb[2])
    arr.append((r, g, b))
}

var dp = [(r: Int, g: Int, b: Int)](repeating: (0, 0, 0), count: n + 1)

for i in 1...n {
    dp[i].r = min(dp[i - 1].g, dp[i - 1].b) + arr[i - 1].r
    dp[i].g = min(dp[i - 1].r, dp[i - 1].b) + arr[i - 1].g
    dp[i].b = min(dp[i - 1].r, dp[i - 1].g) + arr[i - 1].b
}

print(min(dp[n].r, dp[n].g, dp[n].b))
