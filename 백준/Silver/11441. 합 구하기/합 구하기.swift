let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var temp = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
    temp[i + 1] = temp[i] + nums[i]
}
let m = Int(readLine()!)!
var result = ""
for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (ij[0], ij[1])
    result += "\(temp[j] - temp[i - 1])\n"
}
print(result)