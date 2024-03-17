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

let n = Int(readLine()!)!
let pc = readLine()!.split(separator: " ").map { Int($0)! }
let (p, c) = (pc[0], pc[1])
let m = Int(readLine()!)!

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (xy[0], xy[1])
    edges[y].append(x)
    edges[x].append(y)
}

var queue = Queue<(v: Int, count: Int)>()
queue.enqueue((p, 0))
visited[p] = true

var result = -1

while queue.isEmpty == false {
    let now = queue.dequeue()
    if now.v == c {
        result = now.count
        break
    }
    for edge in edges[now.v] {
        if visited[edge] == false {
            queue.enqueue((edge, now.count + 1))
            visited[now.v] = true
        }
    }
}
print(result)
