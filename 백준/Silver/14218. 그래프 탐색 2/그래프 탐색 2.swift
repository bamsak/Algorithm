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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
  let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  let (a, b) = (ab[0], ab[1])
  map[a].append(b)
  map[b].append(a)
}

let q = Int(readLine()!)!
var queue = Queue<(node: Int, count:Int)>()

for _ in 0..<q {
  let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  let (a, b) = (ab[0], ab[1])
  
  map[a].append(b)
  map[b].append(a)
  var visited = Array(repeating: -1, count: n)
  queue.enqueue((0, 0))
  visited[0] = 0
  
  while let current = queue.dequeue() {
    for next in map[current.node] where visited[next] == -1 {
      queue.enqueue((next, current.count + 1))
      visited[next] = current.count + 1
    }
  }
  
  print(visited.map {"\($0)"}.joined(separator: " "))
}
