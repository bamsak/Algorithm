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

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (nmv[0], nmv[1], nmv[2])

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var dfsVisited = [Bool](repeating: false, count: n + 1)
var bfsVisited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    edges[xy[0]].append(xy[1])
    edges[xy[1]].append(xy[0])
}

for i in 1...n {
    edges[i] = edges[i].sorted()
}

var dfsResult = ""
func dfs(v: Int) {
    if dfsVisited[v] == true { return }
    dfsVisited[v] = true
    dfsResult += "\(v) "
    for edge in edges[v] {
        if dfsVisited[edge] == false {
            dfs(v: edge)
        }
    }
}

var bfsResult = ""
func bfs(v: Int) {
    var queue = Queue<Int>()
    queue.enqueue(v)
    bfsVisited[v] = true

    while queue.isEmpty == false {
        let vertex = queue.dequeue()
        bfsResult += "\(vertex) "
        for edge in edges[vertex] {
            if bfsVisited[edge] == false {
                bfsVisited[edge] = true
                queue.enqueue(edge)
            }
        }
    }
}

dfs(v: v)
bfs(v: v)
print(dfsResult)
print(bfsResult)