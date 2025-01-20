let n = Int(readLine()!)!
let stones = readLine()!.split(separator: " ").map { Int($0)! }
let s = Int(readLine()!)! - 1
var visited = [Bool](repeating: false, count: n)

var result = 0
var stack = [Int]()
stack.append(s)
visited[s] = true

while let current = stack.popLast() {
    let left = current - stones[current]
    let right = current + stones[current]
    result += 1
    
    if left >= 0 && !visited[left] {
        stack.append(left)
        visited[left] = true
    }
    
    if right < n && !visited[right] {
        stack.append(right)
        visited[right] = true
    }
}


print(result)
