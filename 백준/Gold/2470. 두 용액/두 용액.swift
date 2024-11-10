let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var left = 0
var right = n - 1
var value = Int.max
var result = (left: 0, right: 0)

while left < right {
    let temp = array[left] + array[right]
    
    if abs(temp) < value {
        result = (array[left], array[right])
        value = abs(temp)
    }
    
    if temp == 0 { break }
    
    if temp < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print("\(result.left) \(result.right)")
