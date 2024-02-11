let nm = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m) = (nm[0], nm[1])

while m != 0 {
    let i = n % m
    n = m
    m = i
}

print("\(n)\n\(nm[0] * nm[1] / n)")
