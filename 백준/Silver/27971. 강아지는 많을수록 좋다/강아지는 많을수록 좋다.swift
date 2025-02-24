let nmab = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, a, b) = (nmab[0], nmab[1], nmab[2], nmab[3])

var temp = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (lr[0], lr[1])
    
    for i in l...r {
        temp[i] = true
    }
}

var dp = [Int](repeating: Int.max, count: n + 1)
dp[0] = 0

for i in 0...n where dp[i] != Int.max {
    let (newA, newB) = (i + a, i + b)
    
    if newA <= n && !temp[newA] {
        dp[newA] = min(dp[newA], dp[i] + 1)
    }
    
    if newB <= n && !temp[newB] {
        dp[newB] = min(dp[newB], dp[i] + 1)
    }
}

print(dp[n] == Int.max ? -1 : dp[n])
