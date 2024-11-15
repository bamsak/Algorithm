let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var left = 0
var right = n - 1
var result = Int.max

while left < right {
    let temp = arr[left] + arr[right]
    
    if abs(temp) < abs(result) {
        result = temp
    }
    
    if temp == 0 { break }
    
    if temp < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(result)