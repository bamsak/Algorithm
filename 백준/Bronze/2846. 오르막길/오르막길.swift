let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

var start = p[0]
var end = p[0]

for i in 1..<n {
    if p[i] <= end {
        start = p[i]
        end = p[i]
    } else {
        end = p[i]
    }
    
    result = max(result, end - start)
}

print(result)