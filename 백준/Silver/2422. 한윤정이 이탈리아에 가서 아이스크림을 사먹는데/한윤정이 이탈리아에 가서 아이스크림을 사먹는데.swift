let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var temp = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    temp[a][b] = true
    temp[b][a] = true
}

var result = 0

for i in 0..<n {
    for j in i + 1..<n where !temp[i][j] {
        for k in j + 1..<n where !temp[i][k] && !temp[j][k] {
            result += 1
        }
    }
}

print(result)
