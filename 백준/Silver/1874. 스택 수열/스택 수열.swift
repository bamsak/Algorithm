var stack = [Int]()
var result = ""
var current = 1

for _ in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    
    while current <= num {
        stack.append(current)
        result += "+\n"
        current += 1
    }
    
    if stack.last! == num {
        stack.removeLast()
        result += "-\n"
    } else {
        result = "NO"
        break
    }
}

print(result)