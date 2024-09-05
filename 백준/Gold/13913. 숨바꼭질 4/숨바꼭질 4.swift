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

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var parent = Array(repeating: -1, count: 100_001)
var visited = Array(repeating: false, count: 100_001)
var queue = Queue<(x: Int, count: Int)>()
visited[n] = true

var count = 0
queue.enqueue((n, 0))
while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.x == k {
        count = current.count
        break
    }
    
    for newX in [current.x * 2, current.x - 1, current.x + 1] where newX >= 0 && newX < 100_001 {
        if visited[newX] { continue }
        visited[newX] = true
        parent[newX] = current.x
        queue.enqueue((newX, current.count + 1))
    }
}

var node = k
var route = ["\(k)"]

while parent[node] != -1 {
    route.append("\(parent[node])")
    node = parent[node]
}


print(count)
print(route.reversed().joined(separator: " "))
