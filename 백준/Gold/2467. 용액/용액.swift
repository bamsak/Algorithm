let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = (left: 0, right: 0)
var diff = Int.max
var (left, right) = (0, n - 1)

while left < right {
    let temp = arr[left] + arr[right]
    
    if abs(temp) <= diff {
        diff = abs(temp)
        result = (arr[left], arr[right])
    }
    
    if temp == 0 { break }
    
    if temp < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print("\(result.left) \(result.right)")
