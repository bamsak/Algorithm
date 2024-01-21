var stack = [Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push":
        stack.append(Int(input[1])!)
    case "pop":
        stack.isEmpty ? print(-1) : print(stack.removeLast())
    case "size":
        print(stack.count)
    case "top":
        stack.isEmpty ? print(-1) : print(stack.last!)
    default:
        stack.isEmpty ? print(1) : print(0)
    }
}