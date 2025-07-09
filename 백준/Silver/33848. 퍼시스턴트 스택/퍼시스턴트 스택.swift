let q = Int(readLine()!)!
var stack = [Int]()
var temp = [(op: Int, value: Int)]()
var result = ""

for _ in 0..<q {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  switch input[0] {
    case 1:
    stack.append(input[1])
    temp.append((1, input[1]))
    case 2:
    temp.append((2, stack.removeLast()))
    case 3:
    for _ in 0..<input[1] {
      guard let n = temp.popLast() else { break }
      if n.op == 1 {
        stack.removeLast()
      } else {
        stack.append(n.value)
      }
    }
    case 4:
    result += "\(stack.count)\n"
    default:
    let last = stack.last ?? -1
    result += "\(last)\n"
  }
}

print(result)