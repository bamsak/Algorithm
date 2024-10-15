for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var visited = Array(repeating: false, count: n)
    
    var graph = Array(repeating: Array(repeating: 0, count: 0), count: n)
    var stack = [Int]()
    var result = 0
    
    for i in 0..<n {
        graph[i].append(nums[i])
    }
    
    for num in nums where !visited[num] {
        stack.append(num)
        visited[num] = true
        result += 1
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            for node in graph[current] where !visited[node] {
                stack.append(node)
                visited[node] = true
            }
        }
    }
    print(result)
}