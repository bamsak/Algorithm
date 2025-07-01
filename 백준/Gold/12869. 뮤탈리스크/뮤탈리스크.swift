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

let damage = [
  (9, 3, 1),
  (9, 1, 3),
  (3, 9, 1),
  (3, 1, 9),
  (1, 9, 3),
  (1, 3, 9)
]

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var queue = Queue<(scv:(Int, Int, Int), count: Int)>()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 61), count: 61), count: 61)

switch n {
  case 1:
  queue.enqueue(((arr[0], 0, 0), 0))
  case 2:
  queue.enqueue(((arr[0], arr[1], 0), 0))
  default:
  queue.enqueue(((arr[0], arr[1], arr[2]), 0))
}

while let current = queue.dequeue() {
  if current.scv.0 == 0 && current.scv.1 == 0 && current.scv.2 == 0 {
    print(current.count)
    break
  }
  
  for i in 0..<damage.count {
    let a = max(0, current.scv.0 - damage[i].0)
    let b = max(0, current.scv.1 - damage[i].1)
    let c = max(0, current.scv.2 - damage[i].2)
    
    if !visited[a][b][c] {
      queue.enqueue(((a, b, c), current.count + 1))
      visited[a][b][c] = true
    }
  }
}