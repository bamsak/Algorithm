let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var arr = [(i:Int, t: Int)]()

for _ in 0..<k {
  let ik = readLine()!.split(separator: " ").map { Int($0)! }
  arr.append((ik[0], ik[1]))
}

var dp = [Int](repeating: -1, count: n + 1)
dp[0] = 0

for i in 0..<k {
  if arr[i].t > n { continue }
  
  for j in (arr[i].t...n).reversed() where dp[j - arr[i].t] != -1 {
    dp[j] = max(dp[j], dp[j - arr[i].t] + arr[i].i)
  }
}

print(dp.max()!)