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
            input.removeAll()
        }
        return output.removeLast()
    }
}

let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (ab[0], ab[1])
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let st = readLine()!.split(separator: " ").map { Int($0)! }
    edges[st[0]].append(st[1])
    edges[st[1]].append(st[0])
}

var result = -1
var queue = Queue<(num: Int, count: Int)>()
queue.enqueue((a, 0))
visited[a] = true

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.num == b {
        result = current.count
        break
    }
    
    for edge in edges[current.num] where !visited[edge] {
        visited[edge] = true
        queue.enqueue((edge, current.count + 1))
    }
}

print(result)
