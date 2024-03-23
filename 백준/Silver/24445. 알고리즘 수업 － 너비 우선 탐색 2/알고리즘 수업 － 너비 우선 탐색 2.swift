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
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (uv[0], uv[1])
    
    edges[u].append(v)
    edges[v].append(u)
}

var count = 0
var result = Array(repeating: 0, count: n + 1)
var queue = Queue<Int>()

queue.enqueue(r)
visited[r] = true

while queue.isEmpty == false {
    let now = queue.dequeue()
    count += 1
    result[now] = count
    
    for edge in edges[now].sorted(by: >) {
        if visited[edge] == false {
            visited[edge] = true
            queue.enqueue(edge)
        }
    }
}

print(result[1...].map { String($0) }.joined(separator: "\n"))