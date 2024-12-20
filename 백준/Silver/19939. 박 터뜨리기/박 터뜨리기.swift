let nk = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (nk[0], nk[1])

n -= k * (k + 1) / 2

if n < 0 {
    print(-1)
} else {
    n %= k
    n == 0 ? print(k - 1) : print(k)
}
