var result = 0
var stack = [(a: Int, t: Int)]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!
    if input == "0" {
        if stack.isEmpty { continue }
        var temp = stack.removeLast()
        temp.t -= 1
        if temp.t == 0 {
            result += temp.a
        } else {
            stack.append(temp)
        }
        continue
    }
    
    let at = input.split(separator: " ").map { Int($0)! }
    
    let (a, t) = (at[1], at[2] - 1)
    if t == 0 {
        result += a
        continue
    }
    stack.append((a, t))
}

print(result)