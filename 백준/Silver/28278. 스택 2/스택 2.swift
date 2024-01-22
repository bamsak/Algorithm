var stack = [Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    switch input[0] {
    case 1:
        stack.append(input[1])
    case 2:
        stack.isEmpty ? print(-1) : print(stack.removeLast())
    case 3:
        print(stack.count)
    case 5:
        stack.isEmpty ? print(-1) : print(stack.last!)
    default:
        stack.isEmpty ? print(1) : print(0)
    }
}
