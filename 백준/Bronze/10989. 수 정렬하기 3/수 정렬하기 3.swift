let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: 10001)

for _ in 0..<n {
    let num = Int(readLine()!)!
    arr[num] += 1
}

var result = ""
for i in 1...10000 {
    if arr[i] > 0 {
        result.append(String(repeating: "\(i)\n", count: arr[i]))
    }
}

print(result)