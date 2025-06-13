let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = [[Int]]()

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var result = 0

for i in 0..<m - 2 {
    for j in i + 1..<m - 1 {
        for k in j + 1..<m {
            var temp = 0
            for p in 0..<n {
                temp += max(arr[p][i], arr[p][j], arr[p][k])
            }
            result = max(result, temp)
        }
    }
}

print(result)
