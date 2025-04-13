let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = Int.max

for i in 0..<n {
    let teamSum = arr[i] + arr[2 * n - 1 - i]
    result = min(result, teamSum)
}

print(result)
