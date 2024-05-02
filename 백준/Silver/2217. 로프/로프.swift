let n = Int(readLine()!)!
var ropes = [Int]()
var result = 0

for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}

ropes.sort()

var idx = ropes.count

for rope in ropes {
    result = max(result, rope * idx)
    idx -= 1
}

print(result)