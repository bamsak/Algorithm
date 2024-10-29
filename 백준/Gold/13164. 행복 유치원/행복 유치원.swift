let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let heights = readLine()!.split(separator: " ").map { Int($0)! }

var temp = [Int]()

for i in 0..<n - 1 {
    temp.append(abs(heights[i] - heights[i + 1]))
}
temp.sort()
var result = 0

for i in 0..<n - k {
    result += temp[i]
}

print(result)