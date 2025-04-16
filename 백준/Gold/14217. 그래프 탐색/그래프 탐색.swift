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

var cities = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
  let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  cities[ab[0]].append(ab[1])
  cities[ab[1]].append(ab[0])
}

let q = Int(readLine()!)!

var result = ""
var canGo = Array(repeating: Array(repeating: true, count: n), count: n)

for _ in 0..<q {
  let aij = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, i, j) = (aij[0], aij[1] - 1, aij[2] - 1)
  
  if a == 1 {
    canGo[i][j] = true
    canGo[j][i] = true
    cities[i].append(j)
    cities[j].append(i)
  } else {
    canGo[j][i] = false
    canGo[i][j] = false
  }
  var queue = Queue<(node: Int, count: Int)>()
  var visited = Array(repeating: false, count: n)
  var distance = Array(repeating: -1, count: n)
  queue.enqueue((0, 0))
  visited[0] = true
  distance[0] = 0
  
  while let current = queue.dequeue() {
    
    for city in cities[current.node] where !visited[city] && canGo[current.node][city] {
      distance[city] = current.count + 1
      queue.enqueue((city, current.count + 1))
      visited[city] = true
    }
  }
  result += "\(distance.map { String($0) }.joined(separator: " "))\n"
}

print(result)
