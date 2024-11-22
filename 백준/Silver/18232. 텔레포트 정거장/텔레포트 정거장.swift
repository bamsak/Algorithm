struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let se = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (s, e) = (se[0], se[1])
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    map[uv[0]].append(uv[1])
    map[uv[1]].append(uv[0])
}
var visited = Array(repeating: false, count: n)

var queue = Queue<(num: Int, count: Int)>()
queue.enqueue((s, 0))
visited[s] = true

var result = 0
while !queue.isEmpty {
    let current = queue.dequeue()

    if current.num == e {
        result = current.count
        break
    }
    
    if !map[current.num].isEmpty {
        for i in map[current.num] where !visited[i] {
            queue.enqueue((i, current.count + 1))
            visited[i] = true
        }
    }
    
    for i in [1, -1] {
        let new = current.num + i
        if new < 0 || new >= n { continue }
        if visited[new] { continue }
        queue.enqueue((new, current.count + 1))
        visited[new] = true
    }
}
print(result)
