let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let a = readLine()!.split(separator: " ").map { Int($0)! }
var count = 0
for i in 0..<n {
    var sum = 0
    for j in i..<n {
        sum += a[j]
        if sum == m {
            count += 1
        }
    }
}

print(count)