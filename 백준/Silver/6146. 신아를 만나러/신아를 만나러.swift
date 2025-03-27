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

let xyn = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y, n) = (xyn[0] + 500, xyn[1] + 500, xyn[2])

var map = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var queue = Queue<(x: Int, y: Int, count: Int)>()

for _ in 0..<n {
  let ab = readLine()!.split(separator: " ").map { Int($0)! + 500 }
  map[ab[1]][ab[0]] = true
}

queue.enqueue((500, 500, 0))
map[500][500] = true

var result = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while let current = queue.dequeue() {
  if current.x == x && current.y == y {
    result = current.count
    break
  }
  
  for i in 0..<4 {
    let newX = dx[i] + current.x
    let newY = dy[i] + current.y
    
    if newX < 0 || newX >= 1001 || newY < 0 || newY >= 1001 { continue } 
    if map[newY][newX] { continue }
    queue.enqueue((newX, newY, current.count + 1))
    map[newY][newX] = true
  }  
}

print(result)