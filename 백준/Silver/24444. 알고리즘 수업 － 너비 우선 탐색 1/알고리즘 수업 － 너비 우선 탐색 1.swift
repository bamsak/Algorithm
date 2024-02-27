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

var edges = [[Int]](repeating: [], count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    edges[xy[0]].append(xy[1])
    edges[xy[1]].append(xy[0])
}

var count = 0
var result = [Int](repeating: 0, count: n + 1)

func bfs(r: Int) {
    var queue = Queue<Int>()
    visited[r] = true
    queue.enqueue(r)

    while queue.isEmpty == false {
        let value = queue.dequeue()
        count += 1
        result[value] = count

        for edge in edges[value].sorted() {
            if visited[edge] == false {
                visited[edge] = true
                queue.enqueue(edge)
            }
        }
    }
}

bfs(r: r)
print(result[1...].map { String($0) }.joined(separator: "\n"))