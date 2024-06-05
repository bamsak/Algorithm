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

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: -1, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    edges[uv[0]].append(uv[1])
    edges[uv[1]].append(uv[0])
}

var queue = Queue<(node: Int, depth: Int)>()
queue.enqueue((r, 0))
visited[r] = 0

while !queue.isEmpty {
    let current = queue.dequeue()
    
    for edge in edges[current.node] where visited[edge] == -1 {
        queue.enqueue((edge, current.depth + 1))
        visited[edge] = current.depth + 1
    }
}

visited[1...].forEach { print($0) }