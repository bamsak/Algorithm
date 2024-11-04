let n = Int(readLine()!)!
var buildings = [Int]()

for _ in 0..<n {
    buildings.append((Int(readLine()!)!))
}

var stack = [Int]()
var result = 0

for i in 0..<n {
    while let last = stack.last, last <= buildings[i] {
        stack.removeLast()
    }
    result += stack.count
    stack.append(buildings[i])
}

print(result)