for _ in 0..<Int(readLine()!)! {
    var stack = [Character]()
    var result = "YES"
    let input = readLine()!.map { $0 }
    
    for i in 0..<input.count {
        if input[i] == "(" {
            stack.append(input[i])
            continue
        }
        
        if stack.isEmpty {
            result = "NO"
            break
        }
        
        stack.removeLast()
    }
    
    if !stack.isEmpty { result = "NO" }
    print(result)
}