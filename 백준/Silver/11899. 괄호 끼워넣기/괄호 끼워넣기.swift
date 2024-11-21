let input = readLine()!.map{ $0 }
var stack = [Character]()
var temp = 0
for i in input {
    if i == "(" {
        stack.append(i)
        continue
    }
    
    if !stack.isEmpty {
        stack.removeLast()
    } else {
        temp += 1
    }
}
print(temp + stack.count)
