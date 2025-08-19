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

let nmt = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, t) = (nmt[0], nmt[1], nmt[2])

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: 2)

var map = [[Int]]()


for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var queue = Queue<(x:Int, y: Int, count: Int, hasgram: Bool)>()

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var result = "Fail"
queue.enqueue((0, 0, 0, map[0][0] == 2 ? true : false))

while let current = queue.dequeue() {
  if current.y == n - 1 && current.x == m - 1 {
    if current.count <= t {
      result = "\(current.count)"
    }
    break
  }
  
  for i in 0..<dx.count {
    let newX = dx[i] + current.x
    let newY = dy[i] + current.y
    
    if newX < 0 || newX >= m || newY < 0 || newY >= n {
      continue
    }
    
    if current.hasgram && !visited[1][newY][newX] {
      queue.enqueue((newX, newY, current.count + 1, true))
      visited[1][newY][newX] = true
      continue
    }
    
    if map[newY][newX] == 2 && !visited[1][newY][newX] {
      queue.enqueue((newX, newY, current.count + 1, true))
      visited[1][newY][newX] = true
    }
    
    if !visited[0][newY][newX] && map[newY][newX] != 1 {
      queue.enqueue((newX, newY, current.count + 1, current.hasgram))
      visited[0][newY][newX] = true
    }
    
  }
}

print(result)