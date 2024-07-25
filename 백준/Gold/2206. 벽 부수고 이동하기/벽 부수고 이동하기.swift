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

let nm = readLine()!.split(separator: " ").map { Int($0)!}
let (n, m) = (nm[0], nm[1])

var map = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: 2)

for i in 0..<n {
    map[i] = readLine()!.map { Int(String($0))! }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int, count: Int, wallCount: Int)>()
queue.enqueue((0, 0, 1, 0))
visited[0][0][0] = true

var result = -1

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.x == m - 1 && current.y == n - 1 {
        result = current.count
        break
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if visited[current.wallCount][newY][newX] { continue }
        
        if map[newY][newX] == 1 && current.wallCount == 0 {
            queue.enqueue((newX, newY, current.count + 1, current.wallCount + 1))
            visited[current.wallCount + 1][newY][newX] = true
            continue
        }
        
        if map[newY][newX] == 0 {
            queue.enqueue((newX, newY, current.count + 1, current.wallCount))
            visited[current.wallCount][newY][newX] = true
        }
    }
}

print(result)