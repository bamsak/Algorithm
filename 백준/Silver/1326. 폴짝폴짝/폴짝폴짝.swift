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

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (a, b) = (ab[0], ab[1])
var queue = Queue<(node: Int, count: Int)>()
var visited = [Int](repeating: -1, count: n)

queue.enqueue((a, 0))
visited[a] = 0

while let current = queue.dequeue() {
  if current.node == b {
    break
  }
  
  let temp = nums[current.node]
  var next = current.node + temp
  
  while next < n {
    if visited[next] == -1 {
      queue.enqueue((next, current.count + 1))
      visited[next] = current.count + 1
    }
    next += temp
  }
  
  next = current.node - temp
  
  while next > -1 {
    if visited[next] == -1 {
      queue.enqueue((next, current.count + 1))
      visited[next] = current.count + 1
    }
    next -= temp
  }
}

print(visited[b])