let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0
var start = 0
var end = n - 1

while start < end {
    if arr[start] + arr[end] > m {
        end -= 1
        continue
    }
    
    if arr[start] + arr[end] < m {
        start += 1
        continue
    }
    
    result += 1
    end -= 1
    start += 1
}

print(result)
