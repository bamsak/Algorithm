let n = Int(readLine()!)!
var result = 0

for _ in 0..<n{
    var stack = [Character]()
    let input = readLine()!.map { $0 }
    
    for s in input {
        stack.last == s ? _ = stack.removeLast() : stack.append(s)
    }
    
    if stack.isEmpty { result += 1 }
}

print(result)