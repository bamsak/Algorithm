let n = Int(readLine()!)!
var numTags = readLine()!.split(separator: " ").map { Int($0)! }
var stack = [Int]()
var num = 1

for numTag in numTags {
    stack.append(numTag)
    while !stack.isEmpty && stack.last! == num {
        stack.removeLast()
        num += 1
    }
}

print(stack.isEmpty ? "Nice" : "Sad")