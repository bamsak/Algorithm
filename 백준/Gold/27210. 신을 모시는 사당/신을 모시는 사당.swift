let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = arr[0] == 1 ? 1 : 0
var right = arr[0] != 1 ? 1 : 0

var result = max(left, right)

for i in 1..<n {
    if arr[i] == 1 {
        left += 1
        right = max(0, right - 1)
    } else {
        right += 1
        left = max(0, left - 1)
    }
    
    result = max(result, abs(left - right))
}

print(result)

