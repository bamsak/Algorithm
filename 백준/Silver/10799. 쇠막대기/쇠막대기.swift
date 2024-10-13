let stick = readLine()!

var result = 0
var stack = [Character]()
var previous: Character = " "

for s in stick {
    if s == "(" {
        stack.append(s)
    } else {
        stack.removeLast()
        
        if previous == "(" {
            result += stack.count
        } else {
            result += 1
        }
    }
    previous = s
}
print(result)
