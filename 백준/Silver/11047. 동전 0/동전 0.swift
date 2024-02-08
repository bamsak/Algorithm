let nk = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (nk[0], nk[1])

var moneys = [Int]()
var count = 0

for _ in 0..<n {
    moneys.append(Int(readLine()!)!)
}

for money in moneys.reversed() {
    if k < money {
        continue
    }
    if k == 0 {
        break
    }
    count += k / money
    k = k % money
}

print(count)