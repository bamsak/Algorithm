let n = Int(readLine()!)!
var map = [(l: Int, m: Int, r: Int)]()

for _ in 0..<n {
  let lmr = readLine()!.split(separator: " ").map { Int($0)! }
  map.append((lmr[0], lmr[1], lmr[2]))
}

var dp = [(l: (minl: Int, maxl: Int), m: (minm: Int, maxm: Int), r: (minr: Int, maxr: Int))](repeating: ((Int.min, Int.max), (Int.min, Int.max), (Int.min, Int.max)), count: n)
dp[0] = ((map[0].l, map[0].l), (map[0].m, map[0].m), (map[0].r, map[0].r))

for i in 1..<n {
  dp[i].l = (min(dp[i - 1].l.minl, dp[i - 1].m.minm) + map[i].l, max(dp[i - 1].l.maxl, dp[i - 1].m.maxm) + map[i].l)
  dp[i].m = (min(dp[i - 1].l.minl, dp[i - 1].m.minm, dp[i - 1].r.minr) + map[i].m, max(dp[i - 1].l.maxl, dp[i - 1].m.maxm, dp[i - 1].r.maxr) + map[i].m)
  dp[i].r = (min(dp[i - 1].r.minr, dp[i - 1].m.minm) + map[i].r, max(dp[i - 1].r.maxr, dp[i - 1].m.maxm) + map[i].r)
}


print("\(max(dp[n - 1].l.maxl, dp[n - 1].m.maxm, dp[n - 1].r.maxr)) \(min(dp[n - 1].l.minl, dp[n - 1].m.minm, dp[n - 1].r.minr))")

