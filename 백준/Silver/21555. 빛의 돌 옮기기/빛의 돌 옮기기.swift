let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let A = readLine()!.split(separator: " ").map { Int($0)! },
    B = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [(a: Int, b: Int)](repeating: (0, 0), count: n)
dp[0] = (A[0], B[0])

for i in 1..<n {
    dp[i].a = min(dp[i - 1].a + A[i], dp[i - 1].b + k + A[i])
    dp[i].b = min(dp[i - 1].b + B[i], dp[i - 1].a + k + B[i])
}

print(min(dp[n - 1].a, dp[n - 1].b))
