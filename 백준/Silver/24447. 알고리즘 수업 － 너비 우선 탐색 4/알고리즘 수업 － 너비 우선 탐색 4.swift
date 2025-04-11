struct Queue<T> {
  private var input = [T]()
  private var output = [T]()
  
  mutating func enqueue(_ newElement: T) {
    input.append(newElement)
  }
  
  mutating func dequeue() -> T? {
    if output.isEmpty {
      output = input.reversed()
      input = []
    }
    return output.popLast()
  }
}


let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2] - 1)
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
  let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  edges[uv[0]].append(uv[1])
  edges[uv[1]].append(uv[0])
}

var visited = [Bool](repeating: false, count: n)
var result = [(depth: Int, turn: Int)](repeating: (-1, 0), count: n)

var queue = Queue<(node: Int, depth: Int, turn: Int)>()
queue.enqueue((r, 0, 1))
visited[r] = true
var t = 1
while let current = queue.dequeue() {
  result[current.node] = (current.depth, current.turn)

  for edge in edges[current.node].sorted() where !visited[edge] {
    t += 1
    queue.enqueue((edge, current.depth + 1, t))
    visited[edge] = true
  }
}

print(result.map { $0.depth * $0.turn }.reduce(0, +))