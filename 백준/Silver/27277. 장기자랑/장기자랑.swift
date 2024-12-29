let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = array.last!
var left = 0
var right = n - 2

while left < right {
    result += array[right] - array[left]
    left += 1
    right -= 1
}

print(result)
