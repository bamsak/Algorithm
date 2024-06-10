let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

if n == 1 {
    print(1)
} else if n == 2 {
    print(min(4, (m + 1) / 2))
} else if m < 7 {
    print(min(4, m))
} else {
    print(m - 2)
}